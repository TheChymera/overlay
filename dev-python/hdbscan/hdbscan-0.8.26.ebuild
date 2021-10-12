# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="A high performance implementation of HDBSCAN clustering."
HOMEPAGE="https://github.com/scikit-learn-contrib/hdbscan"
SRC_URI="https://github.com/scikit-learn-contrib/hdbscan/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
# Tests fail, reported to upstream
# https://github.com/scikit-learn-contrib/hdbscan/issues/501

DEPEND=""
RDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	sci-libs/scikit-learn[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest
