# Copyright 2021-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
# dev-python/hdf5storage is holding 3.10 back
inherit distutils-r1

DESCRIPTION="Extract, convert, and interface with extracellular data, now in spikeinterfaces"
HOMEPAGE="https://github.com/SpikeInterface/spikeextractors"
SRC_URI="https://github.com/SpikeInterface/spikeextractors/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
# dev-python/hdf5storage, datalad, and neo hold back ~x86
IUSE="test"
RESTRICT="test"
# Tests fail, but the package is deprecated, so no use checking with upstream.
# We only distribute this because nwb-conversion-tools still uses it.

RDEPEND="
	dev-python/h5py[${PYTHON_USEDEP}]
	dev-python/hdf5storage[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/loky[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/neo[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pynwb[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-vcs/datalad
"
# also needs
# pyintan
# pyopenephys
# nixio
# shybird
# mtscomp
# exdir
# sonpy
# pyyaml and shybird might not really be needed
DEPEND="
	test? (
		dev-python/parameterized[${PYTHON_USEDEP}]
		dev-python/tridesclous[${PYTHON_USEDEP}]
		dev-vcs/datalad
		${RDEPEND}
	)
"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${PN}-0.9.7-no-test-install.patch"
)

distutils_enable_tests pytest

src_install() {
	pwd
	ls -lah
	rm -rf tests/ || die "Could not remove tests directory incorrectly selected by package for install."
	ls -lah
	distutils-r1_src_install
}
