# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1 gnome2-utils virtualx

MY_HASH="bfc2c0919b68583b6237cbdd9492e69a7bed30189b19dd21f7ba59f9f39e"

DESCRIPTION="The new FSL image viewer, released with FSL 5.0.10"
HOMEPAGE="https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/tree/master"
SRC_URI="
	https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/-/archive/${PV}/${P}.tar.gz
	https://github.com/pauldmccarthy/fsleyes/archive/${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	test? (
		${RDEPEND}
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		)
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

RDEPEND="
	dev-python/fslpy[${PYTHON_USEDEP}]
	=dev-python/jinja-2*[${PYTHON_USEDEP}]
	>=dev-python/matplotlib-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.14.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-3.4.2[${PYTHON_USEDEP}]
	>=dev-python/pyopengl-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyopengl_accelerate-3.1.0[${PYTHON_USEDEP}]
	=dev-python/pyparsing-2*[${PYTHON_USEDEP}]
	=dev-python/six-1*[${PYTHON_USEDEP}]
	>=dev-python/wxpython-3.0.2.0[${PYTHON_USEDEP}]
	>=sci-libs/scipy-0.18[${PYTHON_USEDEP}]
	=sci-libs/nibabel-2*[${PYTHON_USEDEP}]
	sci-visualization/fsleyes-widgets[${PYTHON_USEDEP}]
	sci-visualization/fsleyes-props[${PYTHON_USEDEP}]
	"

PATCHES=(
	"${FILESDIR}/${PN}-0.26.2-fsldir.patch"
	)

src_prepare() {
	sed -i -e "s/Pillow>=3.2.0,<5.0/Pillow>=3.2.0/g" requirements.txt
	distutils-r1_src_prepare
}

python_install_all() {
	distutils-r1_python_install_all
	doicon userdoc/images/fsleyes_icon.png
	local size
	for size in 16 32 128 256 512 ; do
		doicon -s ${size} assets/icons/app_icon/${PN}.iconset/icon_${size}x${size}.png
	done
	make_desktop_entry fsleyes FSLeyes /usr/share/icons/hicolor/128x128/apps/icon_128x128.png
}

pkg_postinst() {
	gnome2_icon_cache_update
}
pkg_postrm() {
	gnome2_icon_cache_update
}

python_test() {
	rm tests/test_addmaskdataseries.py
	rm tests/test_embed.py
	#rm tests/test_overlay_displayprops.py
	#rm tests/test_overlay_freesurfermesh.py
	#rm tests/test_overlay_giftimesh.py
	#rm tests/test_screenshot.py
	#rm tests/test_state.py
	#rm tests/test_views.py
	virtx pytest -vv || die
}
