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

DEPEND=""
RDEPEND="
	dev-python/ci_info[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

distutils_enable_tests pytest

# Due to the clowdish nature of the package, most tests fail:
# https://github.com/sensein/etelemetry-client/issues/41
EPYTEST_DESELECT=(
	"etelemetry/tests/test_client.py::test_etrequest"
	"etelemetry/tests/test_client.py::test_get_project"
	"etelemetry/tests/test_client.py::test_check_available"
)
