# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

MY_PN=etelemetry-client

DESCRIPTION="Lightweight python client to communicate with the etelemetry server"
HOMEPAGE="https://github.com/sensein/etelemetry-client"
SRC_URI="https://github.com/sensein/etelemetry-client/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-python/versioneer[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests pytest
