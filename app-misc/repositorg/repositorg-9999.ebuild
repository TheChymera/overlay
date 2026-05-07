# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{11..14})

inherit distutils-r1 git-r3 systemd

DESCRIPTION="Automatically reposit, organize, rename, and process large collections of files."
HOMEPAGE="https://github.com/TheChymera/repositorg"
EGIT_REPO_URI="https://github.com/TheChymera/repositorg"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="systemd test"
RESTRICT="!test? ( test )"

DEPEND="
	>=dev-python/argh-0.26.2[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	media-libs/mutagen[${PYTHON_USEDEP}]
	systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"
BDEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

# Write the correct version in pyproject.toml
python_prepare_all() {
	sed -i \
		-e "s/dynamic = \[\"version\"\]/version = \"${PV}\"/" \
		-e "/\[tool\.setuptools_scm\]/d" \
		-e "/fallback_version/d" \
		-e "s/\"setuptools-scm\", //" \
		pyproject.toml
	distutils-r1_python_prepare_all
}

python_install() {
	distutils-r1_python_install
	if use systemd; then
		systemd_newunit "${FILESDIR}/${PN}_uuid.service" "${PN}_uuid@.service"
	else
		newinitd "${FILESDIR}/${PN}_uuid.initd" "${PN}_uuid"
	fi
	dobin repositorg_uuid
}

src_test() {
	cd test_scripts/
	for i in *.sh; do
		./"$i" || die "Test $i failed"
	done
}

pkg_postinst() {
	if use !systemd ; then
		elog "To be able to run repositorg_uuid as your user (recommended), make a copy of the init script:"
		elog "	cp /etc/init.d/repositorg_uuid /etc/init.d/repositorg_uuid.<YOUR_USER_NAME>"
	fi
}
