# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Small script(s) to manipulate PDF files"
HOMEPAGE="https://github.com/TheChymera/cdu"
SRC_URI="https://github.com/TheChymera/cdu/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="test? ( dev-util/bats )"
RDEPEND="
	app-text/ghostscript-gpl
"

src_install() {
	einstalldocs
	sed -i "0,/COMMANDS_DIR=/s|COMMANDS_DIR=.*|COMMANDS_DIR=\"${EPREFIX}/usr/libexec/cdu\"|" bin/cdu || die
	dobin bin/cdu
	exeinto /usr/libexec/cdu
	doexe bin/commands/*.sh
}

src_test() {
	bats -r test/* || die
}
