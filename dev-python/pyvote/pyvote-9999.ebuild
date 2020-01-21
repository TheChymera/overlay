# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="Estimate the probability of votes changing election outcomes"
HOMEPAGE="https://github.com/TheChymera/pyvote.git"
EGIT_REPO_URI="https://github.com/TheChymera/pyvote.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND=""
RDEPEND="
	dev-python/argh[${PYTHON_USEDEP}]
	dev-python/mpmath[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
"
