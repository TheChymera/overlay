# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN}-py"

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Next-generation file format (NGFF) for storing bioimaging data in the cloud"
HOMEPAGE="https://github.com/ome/ome-zarr-py"
SRC_URI="https://github.com/ome/ome-zarr-py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
# Tests fail:
# https://github.com/ome/ome-zarr-py/issues/168
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/dask[${PYTHON_USEDEP}]
	dev-python/fsspec[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/quantities[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
	dev-python/zarr[${PYTHON_USEDEP}]
	sci-libs/scikit-image[${PYTHON_USEDEP}]
"
DEPEND="
	test? (
		${RDEPEND}
	)
"

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests pytest
