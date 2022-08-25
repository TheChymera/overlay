# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A Python library for working with the BIDS schema"
HOMEPAGE="https://github.com/bids-standard/bids-specification"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="dev-python/tabulate"
DEPEND=""

#S="${WORKDIR}/bids-specification-${MY_HASH}/tools/schemacode"

distutils_enable_tests pytest

python_test() {
	# Ideally we should package the testdata packages:
	# https://github.com/bids-standard/bids-examples
	# https://github.com/bids-standard/bids-error-examples
	export SCHEMACODE_TESTS_NONETWORK=1
	epytest
}
