# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-ffmpeg/gst-plugins-ffmpeg-0.10.13-r2.ebuild,v 1.3 2012/06/22 11:07:42 ago Exp $

EAPI=4
PYTHON_DEPEND="2:2.4"

inherit base eutils git-2 python

DESCRIPTION="GStreamer-based library for creating audio/video editors"
HOMEPAGE="http://gstreamer.freedesktop.org/modules/gst-editing-services.html"

EGIT_REPO_URI="git://anongit.freedesktop.org/gstreamer/gst-editing-services"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="1.0"

S=${WORKDIR}/${MY_P}

RDEPEND=">=dev-libs/glib-2.34
	>=dev-libs/gobject-introspection-0.9.6
	>=dev-python/pygobject-3.4.22:3
	>=media-libs/gstreamer-1.2.0:1
	>=media-libs/gst-plugins-base-1.2.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	PKG_CONFIG_PATH=../gst-python/pkgconfig ./autogen.sh
	addpredict "$(unset HOME; echo ~)/.cache/gstreamer-1.0"
}
