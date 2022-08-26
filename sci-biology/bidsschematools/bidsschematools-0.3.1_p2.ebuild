# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

#MY_PV=${PV%%_*}
#MY_P="${PN}-${MY_PV}"
MY_HASH="a87f8955b48d663eab08d7706c7302215c0e36d3"
EXAMPLES_HASH="252449184b532ba08c26e53e422f1e05366ac102"
ERROR_EXAMPLES_HASH="4dee93e8dc75ea7b63c94e1657bbc94e3e77dfd0"
inherit distutils-r1

DESCRIPTION="A Python library for working with the BIDS schema"
HOMEPAGE="https://github.com/bids-standard/bids-specification"
SRC_URI="
	https://github.com/bids-standard/bids-specification/archive/${MY_HASH}.tar.gz -> ${P}.gh.tar.gz
	test? (
		https://github.com/bids-standard/bids-examples/archive/${EXAMPLES_HASH}.tar.gz -> bids-examples-${EXAMPLES_HASH}.tar.gz
		https://github.com/bids-standard/bids-error-examples/archive/${ERROR_EXAMPLES_HASH}.tar.gz -> bids-error-examples-${ERROR_EXAMPLES_HASH}.tar.gz
		)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="render"

RDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
	render? (
		dev-python/tabulate[${PYTHON_USEDEP}]
		dev-python/pandas[${PYTHON_USEDEP}]
	)
"
DEPEND=""

#S="${WORKDIR}/${MY_P}"
S="${WORKDIR}/bids-specification-${MY_HASH}/tools/schemacode/"

#PATCHES=(
#	"${FILESDIR}/${P}-static_testdata.patch"
#)

distutils_enable_tests pytest

src_prepare() {
	if use test; then
		mkdir "${S}/testdata" || die "Failed to create testdata directory."
		cp -rf "${WORKDIR}/bids-examples-${EXAMPLES_HASH}" "${S}/testdata/bids-examples" || die "Failed to copy testdata into tree."
		cp -rf "${WORKDIR}/bids-error-examples-${ERROR_EXAMPLES_HASH}" "${S}/testdata/bids-error-examples" || die "Failed to copy testdata into tree."
	fi
	if ! use render; then
		rm "${S}/bidsschematools/render.py"
		rm "${S}/bidsschematools/tests/test_render.py"
	fi
	default
}

python_test() {
	# We want to display INFO logging explicitly stating whether static data was used.
	epytest --log-level=INFO
}
