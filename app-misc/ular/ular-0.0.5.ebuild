# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Minimalistic CLI alarm clock writing state to a temp file."
HOMEPAGE="https://github.com/TheChymera/ualarmer/"
SRC_URI="https://github.com/TheChymera/ualarmer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	media-video/mpv
	x11-themes/sound-theme-freedesktop
"

src_install() {
	dobin bin/*
	einstalldocs
}
