# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1 git-r3

DESCRIPTION=" Simple Gantt Charts in Python "
HOMEPAGE="https://github.com/TheChymera/pygantt"
EGIT_REPO_URI="https://github.com/TheChymera/pygantt.git"

KEYWORDS=""
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"

distutils_enable_tests pytest
