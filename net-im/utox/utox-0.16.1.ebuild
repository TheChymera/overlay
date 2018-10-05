# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit xdg-utils gnome2-utils cmake-utils

DESCRIPTION="Lightweight Tox client"
HOMEPAGE="https://utox.io"
SRC_URI="https://github.com/uTox/uTox/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE="+dbus filter_audio test"
KEYWORDS="~amd64"

RDEPEND="net-libs/tox[av]
	media-libs/freetype
	filter_audio? ( media-libs/libfilteraudio )
	media-libs/libv4l
	media-libs/opus
	media-libs/libvpx
	x11-libs/libXrender
	media-libs/fontconfig
	media-libs/openal
	x11-libs/libX11
	x11-libs/libXext
	dbus? ( sys-apps/dbus )"
DEPEND="${RDEPEND}
	test? ( dev-libs/check )
	virtual/pkgconfig"

S=${WORKDIR}/uTox-${PV}

src_configure() {
	local mycmakeargs=(
		-DENABLE_FILTERAUDIO=$(usex filter_audio ON OFF)
		-DENABLE_DBUS=$(usex dbus ON OFF)
		-DENABLE_TESTS=$(usex test ON OFF)
	)
	cmake-utils_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
