# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Show any image in a terminal window."
HOMEPAGE="https://github.com/stolk/imcat"
SRC_URI=""
EGIT_REPO_URI="https://github.com/stolk/imcat"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="test"

DEPEND=""
RDEPEND=""

src_compile(){
	emake
}

src_install() {
	dobin imcat
}

src_test() {
	./imcat images/* || die
}
