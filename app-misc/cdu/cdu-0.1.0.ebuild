# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	newbin mkstage4.sh mkstage4
	newbin exstage4.sh exstage4
	einstalldocs
}

src_test() {
	bats -r test/* || die
}
