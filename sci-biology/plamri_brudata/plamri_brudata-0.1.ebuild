# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Bruker ParaVision data files for testing the PlaMRI package"
HOMEPAGE="http://jasanofflab.mit.edu/"
SRC_URI="http://resources.chymera.eu/distfiles/${P}.tar.xz"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND=""
DEPEND=""

src_install() {
	insinto "/usr/share/${PN}"
	doins -r *
}
