# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#MY_PN="${PN}-python"

PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
inherit distutils-r1

DESCRIPTION="Chunked, compressed, N-dimensional arrays for Python"
HOMEPAGE="https://github.com/zarr-developers/zarr-python"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
# Tests fail:
# https://github.com/zarr-developers/zarr-python/issues/961
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/asciitree[${PYTHON_USEDEP}]
	dev-python/fasteners[${PYTHON_USEDEP}]
	dev-python/numcodecs[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"

DEPEND="
	test? (
		dev-python/msgpack[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
