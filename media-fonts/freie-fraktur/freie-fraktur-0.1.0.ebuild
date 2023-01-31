# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FONT_S="${S}/fonts"
FONT_SUFFIX="ttf"
inherit font

DESCRIPTION="A collection of freely licensed Fraktur typefaces."
HOMEPAGE="https://gin.g-node.org/TheChymera/freie-fraktur"
SRC_URI="https://gin.g-node.org/TheChymera/freie-fraktur/raw/master/releases/${P}.tar.xz"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

DOCS=( README.md )
