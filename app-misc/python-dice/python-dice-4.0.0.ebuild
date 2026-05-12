# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Dice parsing and evaluation library"
HOMEPAGE="https://github.com/borntyping/python-dice"
SRC_URI="https://github.com/borntyping/python-dice/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="test? (
	dev-python/pytest[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	dev-python/docopt[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.4.1[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
