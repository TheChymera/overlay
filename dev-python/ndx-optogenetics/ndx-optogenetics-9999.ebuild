# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1 git-r3

DESCRIPTION="NWB extension package for better optogenetics support."
HOMEPAGE="https://github.com/TheChymera/ndx-optogenetics"
EGIT_REPO_URI="https://github.com/TheChymera/ndx-optogenetics.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS=""

RDEPEND="
	dev-python/hdmf[${PYTHON_USEDEP}]
	dev-python/pynwb[${PYTHON_USEDEP}]
	"

distutils_enable_tests pytest
