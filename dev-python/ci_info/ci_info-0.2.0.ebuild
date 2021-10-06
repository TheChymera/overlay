# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PN=ci-info

DESCRIPTION="Gather continuous integration information on the fly"
HOMEPAGE="https://github.com/mgxd/ci-info"
SRC_URI="https://github.com/mgxd/ci-info/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND=""
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests pytest
