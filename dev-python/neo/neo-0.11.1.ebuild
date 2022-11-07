# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PN="python-neo"

DESCRIPTION="Read and represent a wide range of neurophysiology file formats in Python"
HOMEPAGE="https://github.com/NeuralEnsemble/python-neo"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
#SRC_URI="https://github.com/NeuralEnsemble/python-neo/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
#RESTRICT="test"
# Numerous test failures, checking with upstream:
# https://github.com/NeuralEnsemble/python-neo/issues/1037

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/quantities[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/scipy[${PYTHON_USEDEP}]
		dev-python/h5py[${PYTHON_USEDEP}]
		dev-python/matplotlib[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/probeinterface[${PYTHON_USEDEP}]
		dev-python/pynwb[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
		dev-vcs/datalad[${PYTHON_USEDEP}]
	)
"
# Testing deps also need:
# igor
# pyedflib https://github.com/holgern/pyedflib
# klusta
# nixio
# sonpy
# ipython

#S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests pytest
