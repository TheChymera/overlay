# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{8..11})

inherit distutils-r1 systemd

DESCRIPTION="Automatically reposit, organize, rename, and process large collections of files."
HOMEPAGE="https://github.com/TheChymera/repositorg"
SRC_URI="https://github.com/TheChymera/repositorg/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systemd"

DEPEND="
	>=dev-python/argh-0.26.2[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	media-libs/mutagen
	systemd? ( sys-apps/systemd )
"
RDEPEND="${DEPEND}"

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
