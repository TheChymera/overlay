# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils gnome2-utils

DESCRIPTION="A simple medical imaging visualization tool"
HOMEPAGE="https://github.com/neurolabusc/MRIcroGL"
SRC_URI="
	https://github.com/rordenlab/MRIcroGL12/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/neurolabusc/Metal-Demos/archive/f487b6a74a8837faa01d1f33bdcdba2e829a16c3.tar.gz
	"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="dev-lang/fpc
	>=dev-lang/lazarus-1.6.2"

S="${WORKDIR}/MRIcroGL12-${PV}"

#src_prepare() {
#	ls
#	pwd
#	die
#	default
#}

src_compile() {
	# Python support will only be vaialable for the default implementation:
	# https://github.com/neurolabusc/MRIcroGL/issues/30#issuecomment-423216197
	cp -rf /etc/lazarus system-lazarus-config
	#lazbuild --verbose-pkgsearch lazopenglcontext --verbose-pkgsearch python4lazarus_package || die
	#lazbuild  -B MRIcroGL.lpr
	lazbuild -B --lazarusdir="/usr/share/lazarus/" --pcp="system-lazarus-config" MRIcroGL_NoPython.lpi || die
}

src_install() {
	dobin MRIcroGL

	insinto /usr/share/mricrogl
	doins -r lut script shaders

	doicon -s scalable mricrogl.svg
	make_desktop_entry MRIcroGL MRIcroGL /usr/share/icons/hicolor/scalable/apps/mricrogl.svg
}

pkg_postinst() {
	gnome2_icon_cache_update
}
pkg_postrm() {
	gnome2_icon_cache_update
}
