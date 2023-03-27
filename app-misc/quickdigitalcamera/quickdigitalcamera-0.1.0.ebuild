# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Personal Pastebin"
HOMEPAGE="https://github.com/TheChymera/quickdigitalcamera"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/TheChymera/quickdigitalcamera.git"
	inherit git-r3
else
	SRC_URI="https://github.com/TheChymera/quickdigitalcamera/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/quickdigitalcamera-${PV}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="
	media-gfx/gphoto2
	media-video/mpv
"
RESTRICT="test"

src_install() {
	dobin bin/*
}
