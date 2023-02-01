# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..10} )
inherit distutils-r1

DESCRIPTION="A Python-based module for creating flexible and robust spike sorting pipelines."
HOMEPAGE="https://github.com/SpikeInterface/spikeinterface"
SRC_URI="https://github.com/SpikeInterface/spikeinterface/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="test"
# Tests fail, checking with upstream
# https://github.com/SpikeInterface/spikeinterface/issues/307

DEPEND="
	${RDEPEND}
	test? (
		dev-python/loky[${PYTHON_USEDEP}]
		dev-python/numba[${PYTHON_USEDEP}]
		dev-python/tridesclous[${PYTHON_USEDEP}]
		sci-libs/spyking-circus[${PYTHON_USEDEP}]
		dev-vcs/datalad
	)
"
RDEPEND="
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/neo[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/probeinterface[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
# also needs:
# dev-python/PyQt5
# hbdscan
# shybird
# herdingspikes
# might also need:
# dev-vcs/git-annex
# dev-python/matplotlib[${PYTHON_USEDEP}]
# sci-libs/scikit-learn[${PYTHON_USEDEP}]
# dev-python/networkx[${PYTHON_USEDEP}]
# dev-python/pybind11[${PYTHON_USEDEP}]
# dev-python/pillow[${PYTHON_USEDEP}]
# dev-python/pandas[${PYTHON_USEDEP}]
# dev-python/h5py[${PYTHON_USEDEP}]
BDEPEND=""

distutils_enable_tests pytest
