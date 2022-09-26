# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Bruker and BIDS data from neurovascular coupling experiments"
HOMEPAGE="https://gitlab.com/Chymera/nvcz"
SRC_URI="
	http://resources.chymera.eu/distfiles/${P}.tar.xz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE=""

RDEPEND=""
DEPEND=""

src_install() {
	insinto "/usr/share/${PN}"
	doins -r *
}
