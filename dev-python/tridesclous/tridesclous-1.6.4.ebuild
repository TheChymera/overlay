# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="offline/online spike sorting"
HOMEPAGE="https://github.com/tridesclous/tridesclous"
SRC_URI="https://github.com/tridesclous/tridesclous/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui test"
RESTRICT="test"
# Tests fail, reported upstream
# https://github.com/tridesclous/tridesclous/issues/175

RDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/hdbscan[${PYTHON_USEDEP}]
	dev-python/loky[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/neo[${PYTHON_USEDEP}]
	dev-python/numba
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/openpyxl[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	sci-libs/scikit-learn[${PYTHON_USEDEP}]
	gui? (
		dev-python/PyQt5[${PYTHON_USEDEP}]
	)
"
# Technically also seaborn:
# dev-python/seaborn[${PYTHON_USEDEP}]
DEPEND="
	test? (
		${RDEPEND}
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_IGNORE=(
		tridesclous/online/tests/test_launcher.py
		tridesclous/online/tests/test_onlinepeeler.py
		tridesclous/online/tests/test_onlinewindow.py
	)
	if use !gui ; then
		EPYTEST_IGNORE+=(
			tridesclous/gui/test_gpuselector.py
			tridesclous/gui/icons/test_ressources.py
			tridesclous/gui/tests/test_cataloguewindow.py
			tridesclous/gui/tests/test_gui_tools.py
			tridesclous/gui/tests/test_initializedatasetwindow.py
			tridesclous/gui/tests/test_mainwindow.py
			tridesclous/gui/tests/test_peelerwindow.py
			tridesclous/gui/tests/test_probegeometryview.py
		)
	fi
	epytest
}
