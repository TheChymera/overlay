# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1 git-r3 systemd

DESCRIPTION="Automatically reposit, organize, rename, and process large collections of files."
HOMEPAGE="https://github.com/TheChymera/repositorg"
SRC_URI=""
EGIT_REPO_URI="https://github.com/TheChymera/repositorg"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	>=dev-python/argh-0.26.2
	media-libs/mutagen
"
RDEPEND="${DEPEND}"

python_install() {
	distutils-r1_python_install
	systemd_newunit "${FILESDIR}/${PN}_uuid.service" "${PN}_uuid@.service"
	dobin repositorg_uuid
}

src_test() {
	cd test_scripts/
	for i in *.sh; do
		./"$i" || die "Test $i failed"
	done
}
