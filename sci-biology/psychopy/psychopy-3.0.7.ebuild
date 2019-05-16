# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6,3_7} )
PYTHON_REQ_USE="threads(+)"

inherit eutils gnome2-utils distutils-r1

DESCRIPTION="Python experimental psychology toolkit"
HOMEPAGE="http://www.psychopy.org/"
SRC_URI="https://github.com/psychopy/psychopy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
USE="qt5"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
RDEPEND="
	dev-python/cffi[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/gevent[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/moviepy[${PYTHON_USEDEP}]
	dev-python/msgpack[${PYTHON_USEDEP}]
	dev-python/numpy[lapack,${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pytables[${PYTHON_USEDEP}]
	dev-python/pyglet[${PYTHON_USEDEP}]
	dev-python/pyopengl[${PYTHON_USEDEP}]
	qt5? ( $(python_gen_cond_dep 'dev-python/PyQt5[${PYTHON_USEDEP}]' 'python3*') )
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/pyzmq[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/wxpython:*[${PYTHON_USEDEP}]
	dev-python/xlrd[${PYTHON_USEDEP}]
	dev-vcs/python-gitlab[${PYTHON_USEDEP}]
	media-libs/opencv[python,${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	"
	#pyosf
	#json_tricks
	#soundfile
	#sounddevice
	#python-bidi
	#arabic_reshaper
	#gitpython
	#astunparse
	#esprima
	#freetype-py
	#pyparallel
python_install_all() {
	distutils-r1_python_install_all
	newicon -s scalable psychopy/monitors/psychopy-icon.svg psychopy.svg
	make_desktop_entry psychopyApp.py PsychoPy psychopy
}

pkg_postinst() {
	gnome2_icon_cache_update
}
pkg_postrm() {
	gnome2_icon_cache_update
}
