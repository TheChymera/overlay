# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1 git-r3

DESCRIPTION="Behavioral data analysis and plotting in Python."
HOMEPAGE="https://github.com/TheChymera/behaviopy"
SRC_URI=""
EGIT_REPO_URI="https://github.com/TheChymera/behaviopy"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS=""

DEPEND=""
RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/seaborn[${PYTHON_USEDEP}]
	dev-python/statsmodels[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
	"
