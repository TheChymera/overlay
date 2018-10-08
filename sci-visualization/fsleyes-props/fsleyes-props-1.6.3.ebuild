# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
#PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1 virtualx

MY_PN="props"

DESCRIPTION="The new FSL image viewer, released with FSL 5.0.10"
HOMEPAGE="https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/tree/master"
SRC_URI="https://git.fmrib.ox.ac.uk/fsl/fsleyes/${MY_PN}/-/archive/${PV}/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
RDEPEND="
	dev-python/deprecation[${PYTHON_USEDEP}]
	=dev-python/numpy-1*[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	=dev-python/six-1*[${PYTHON_USEDEP}]
	dev-python/wxpython[${PYTHON_USEDEP}]
	sci-visualization/fsleyes-widgets[${PYTHON_USEDEP}]
	dev-python/fslpy[${PYTHON_USEDEP}]
	"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	virtx pytest --verbose || die
}

