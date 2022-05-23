# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{7..10} )

inherit distutils-r1

DESCRIPTION=" Simple Gantt Charts in Python "
HOMEPAGE="https://github.com/TheChymera/pygantt"
SRC_URI="https://github.com/TheChymera/pygantt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"

distutils_enable_tests pytest
