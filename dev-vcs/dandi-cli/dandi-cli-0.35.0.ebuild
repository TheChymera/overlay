# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit distutils-r1

DESCRIPTION="DANDI command line client to facilitate common operations"
HOMEPAGE="https://github.com/dandi/dandi-cli"
SRC_URI="https://github.com/dandi/dandi-cli/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test etelemetry"
#RESTRICT="test"
# Test fail during collection, reported upstream: https://github.com/dandi/dandi-cli/issues/774

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/click-didyoumean[${PYTHON_USEDEP}]
	=dev-python/dandischema-0.5*[${PYTHON_USEDEP}]
	dev-python/fasteners[${PYTHON_USEDEP}]
	dev-python/fscacher[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/joblib[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/keyrings_alt[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pycryptodomex[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pynwb[${PYTHON_USEDEP}]
	dev-python/pyout[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/ruamel-yaml[${PYTHON_USEDEP}]
	dev-python/semantic_version[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"
#<dev-python/jsonschema-4[${PYTHON_USEDEP}]
# Errors with newer jsonschema, though not a direct dependency, reported upstream:
# https://github.com/dandi/dandi-cli/issues/825

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/anys[${PYTHON_USEDEP}]
		dev-python/responses[${PYTHON_USEDEP}]
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=(
	"${FILESDIR}/${PN}-0.34.1-pip-versioncheck.patch"
)

src_prepare() {
	if use etelemetry; then
		default
	else
		eapply "${FILESDIR}/${PN}-0.28.0-no-etelemetry.patch"
		default
		sed -i "/etelemetry/d" setup.cfg
	fi
}

python_test() {
	export DANDI_TESTS_NONETWORK=1
	${EPYTHON} -m pytest -vv || die "Tests failed with ${EPYTHON}"
}
