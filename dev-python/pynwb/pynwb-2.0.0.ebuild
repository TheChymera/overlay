# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="A Python API for working with Neurodata stored in the NWB Format "
HOMEPAGE="https://github.com/NeurodataWithoutBorders/pynwb"
SRC_URI="https://github.com/NeurodataWithoutBorders/pynwb/releases/download/${PV}/${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/hdmf[${PYTHON_USEDEP}]
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	"
BDEPEND=""

distutils_enable_tests setup.py
# 2 tests fail, ongoing: https://bugs.gentoo.org/814530
