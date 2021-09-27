# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="Schemata for DANDI archive project"
HOMEPAGE="https://github.com/dandi/dandischema"
EGIT_REPO_URI="https://github.com/dandi/dandischema.git"
SRC_URI="https://github.com/dandi/dandischema/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-email-validator[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

PATCHES=(
	"${FILESDIR}/${P}-coverage.patch"
	"${FILESDIR}/${P}-versioningit.patch"
)

src_configure() {
	echo "__version__ = '${PV}'" >> dandischema/_version.py
}

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# Requires network access:
		# https://github.com/dandi/dandischema/issues/87
		dandischema/tests/test_metadata.py::test_migrate_041
	)
	pushd dandischema || die
		epytest tests
	popd
}
