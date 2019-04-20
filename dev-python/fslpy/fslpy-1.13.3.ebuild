# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1 virtualx

DESCRIPTION="The new FSL image viewer, released with FSL 5.0.10"
HOMEPAGE="https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/tree/master"
SRC_URI="https://github.com/pauldmccarthy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
	=dev-python/six-1*[${PYTHON_USEDEP}]
	dev-python/trimesh[${PYTHON_USEDEP}]
	dev-python/wxpython[${PYTHON_USEDEP}]
	sci-libs/Rtree[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	=sci-libs/nibabel-2*[${PYTHON_USEDEP}]
	"

# Tests fail on Gentoo with mysterious `Fatal Python error: deallocating None`
# https://github.com/pauldmccarthy/fslpy/issues/3
#RESTRICT="test"

#python_prepare_all() {
#	if use test; then
#		# Reported upstream
#		# https://github.com/pauldmccarthy/fslpy/issues/3
#		#sed -i -e \
#		#	"/def test_loadVestLutFile():/i@pytest.mark.xfail(reason='Known to fail on Gentoo')" \
#		#	tests/test_vest.py || die
#		#rm tests/test_vest.py
#	fi
#	distutils-r1_python_prepare_all
#}

python_test() {
	virtx pytest -m "not (dicomtest or fsltest)" --verbose || die
}
