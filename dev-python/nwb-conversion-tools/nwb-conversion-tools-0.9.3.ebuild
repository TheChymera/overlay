# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )
# 3.10 missing on numba and spyking-circus
inherit distutils-r1

DESCRIPTION="Create NWB files by converting proprietary formats and adding essential metadata"
HOMEPAGE="https://github.com/catalystneuro/nwb-conversion-tools"
SRC_URI="https://github.com/catalystneuro/nwb-conversion-tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
#RESTRICT="test"

RDEPEND="
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/neo[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pynwb[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/spikeextractors[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
"
# also needs:
# spikesorters
# spiketoolkit
# neo == 0.9.0, actually
# roiextractors
DEPEND="
	test? (
		${RDEPEND}
	)
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-0.9.3-no-git-versioncheck.patch"
)

distutils_enable_tests pytest
