# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Historical wallpaper artwork"
HOMEPAGE="https://gin.g-node.org/TheChymera/wallpaper-art"
SRC_URI="https://gin.g-node.org/TheChymera/wallpaper-art/raw/master/releases/${P}.tar.xz"

LICENSE="public-domain"
KEYWORDS="amd64 arm arm64 x86"
IUSE=""

RDEPEND=""
DEPEND=""

SLOT="0"

src_install() {
	insinto "/usr/share/backgrounds/${PN}"
	doins -r *
}
