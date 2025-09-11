# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION=" Simple Gantt Charts in Python "
HOMEPAGE="https://github.com/TheChymera/pygantt"
SRC_URI="https://github.com/TheChymera/pygantt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"

distutils_enable_tests pytest
