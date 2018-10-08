# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1

MY_HASH="bfc2c0919b68583b6237cbdd9492e69a7bed30189b19dd21f7ba59f9f39e"

DESCRIPTION="The new FSL image viewer, released with FSL 5.0.10"
HOMEPAGE="https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/tree/master"
SRC_URI="https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/-/archive/${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	test? (
		${RDEPEND}
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
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

PATCHES=( "${FILESDIR}/${P}-fsldir.patch" )

src_prepare() {
	sed -i -e "s/Pillow>=3.2.0,<5.0/Pillow>=3.2.0/g" requirements.txt
	distutils-r1_src_prepare
}

python_test() {
	pytest -v || die
}
