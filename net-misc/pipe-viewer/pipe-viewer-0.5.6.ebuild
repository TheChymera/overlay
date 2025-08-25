# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop optfeature perl-module xdg-utils

DESCRIPTION="A lightweight YouTube client for Linux"
HOMEPAGE="https://github.com/trizen/pipe-viewer"
SRC_URI="https://github.com/trizen/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

RDEPEND="
	dev-perl/Data-Dump
	dev-perl/JSON
	dev-perl/libwww-perl[ssl]
	dev-perl/Term-ReadLine-Gnu
	dev-perl/LWP-Protocol-https
	virtual/perl-Encode
	virtual/perl-File-Path
	virtual/perl-File-Spec
	virtual/perl-Getopt-Long
	virtual/perl-Scalar-List-Utils
	virtual/perl-Term-ANSIColor
	virtual/perl-Text-ParseWords
	virtual/perl-Text-Tabs+Wrap
	gtk? (
		dev-perl/Gtk3
		dev-perl/File-ShareDir
		virtual/freedesktop-icon-theme
		x11-libs/gdk-pixbuf:2[jpeg]
	)
	|| ( media-video/ffmpeg[openssl] media-video/ffmpeg[gnutls] )
	|| ( media-video/mpv media-video/mplayer media-video/vlc gtk? ( media-video/smplayer ) )"
BDEPEND="dev-perl/Module-Build"

src_configure() {
	local myconf
	if use gtk; then
		myconf="--gtk3"
	fi

	perl-module_src_configure
}

src_install() {
	perl-module_src_install

	if use gtk; then
		domenu share/gtk-pipe-viewer.desktop
		doicon share/icons/gtk-pipe-viewer.png
	fi
}

pkg_postinst() {
	use gtk && xdg_icon_cache_update
	elog "Optional dependencies:"
	optfeature "cache support" dev-perl/LWP-UserAgent-Cached
	optfeature "faster JSON to HASH conversion" dev-perl/JSON-XS
	optfeature "the case if there are SSL problems" dev-perl/Mozilla-CA
	optfeature "printing results in a fixed-width format (--fixed-width, -W)" dev-perl/Text-CharWidth
	optfeature "live streams support" net-misc/youtube-dl
	optfeature "threads support" virtual/perl-threads
	elog
	elog "Check the configuration file in ~/.config/pipe-viewer/"
	elog "and configure your video player backend."
}

pkg_postrm() {
	use gtk && xdg_icon_cache_update
}
