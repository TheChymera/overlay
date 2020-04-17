# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit git-r3

RESTRICT="strip"

DESCRIPTION="Integrated processing for exposure-bracketed images"
HOMEPAGE="https://github.com/TheChymera/stackHDR"
EGIT_REPO_URI="https://github.com/TheChymera/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	media-gfx/hugin
	media-gfx/ufraw"

src_install() {
	exeinto /usr/bin/
	newexe "${S}"/stackHDR.sh stackHDR
}
