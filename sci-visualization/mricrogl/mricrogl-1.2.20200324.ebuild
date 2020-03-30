# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils gnome2-utils

MY_HASH="6979db2afb169523d198e973e9033b1c89ddd40b"
DEMOS_HASH="d07815f31093f28b47731f87f3f5ba5543f12d11"
PY4LAZ_HASH="8dc41685b547f0982755b90115d9a43a2d2b358c"

DESCRIPTION="A simple medical imaging visualization tool"
HOMEPAGE="https://github.com/neurolabusc/MRIcroGL"
SRC_URI="
	https://github.com/rordenlab/MRIcroGL12/archive/${MY_HASH}.tar.gz -> ${P}.tar.gz
	https://github.com/neurolabusc/Metal-Demos/archive/${DEMOS_HASH}.tar.gz
	https://github.com/Alexey-T/Python-for-Lazarus/archive/${PY4LAZ_HASH}.tar.gz
	"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="dev-lang/fpc
	>=dev-lang/lazarus-1.6.2"

S="${WORKDIR}/MRIcroGL12-${MY_HASH}"

#src_prepare() {
#	ls
#	pwd
#	die
#	default
#}

src_compile() {
	# Python support will only be vaialable for the default implementation:
	# https://github.com/neurolabusc/MRIcroGL/issues/30#issuecomment-423216197
	#cp -rf /etc/lazarus system-lazarus-config
	##lazbuild --verbose-pkgsearch lazopenglcontext --verbose-pkgsearch python4lazarus_package || die
	##lazbuild  -B MRIcroGL.lpr
	sed -i -e "s:Metal-Demos/common:Metal-Demos-${DEMOS_HASH}/common:g" MRIcroGL_NoPython.lpi || die
	#lazbuild --verbose-pkgsearch lazopenglcontext
	lazbuild -build-ide= --add-package lazopenglcontext ./Python-for-Lazarus-${PY4LAZ}/python4lazarus/python4lazarus_package.lpk || die
	lazbuild -B --lazarusdir="/usr/share/lazarus/" --pcp="system-lazarus-config" MRIcroGL_NoPython.lpi || die
}

src_install() {
	dobin MRIcroGL

	pushd Resources > /dev/null
		insinto /usr/share/MRIcroGL
		doins -r lut matcap Roboto.* script shader
		doicon -s scalable mricrogl.svg
		make_desktop_entry MRIcroGL MRIcroGL /usr/share/icons/hicolor/scalable/apps/mricrogl.svg
	popd
}

pkg_postinst() {
	gnome2_icon_cache_update
}
pkg_postrm() {
	gnome2_icon_cache_update
}
