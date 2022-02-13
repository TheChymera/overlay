# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Reormat text as alternating lower and upper case letters"
HOMEPAGE="https://github.com/Othyem86/sarcasm-formatter"
SRC_URI="https://github.com/Othyem86/sarcasm-formatter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""

src_install() {
	newbin sarcasm.sh sarcasm
	einstalldocs
}
