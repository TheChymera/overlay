# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 git-r3

DESCRIPTION="A Python library for working with the BIDS schema"
HOMEPAGE="https://github.com/bids-standard/bids-specification"
EGIT_REPO_URI="https://github.com/bids-standard/bids-specification.git"
EGIT_COMMIT="54e7990387166fd206cb1f4ec4eb2187b42c08b3"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND="dev-python/tabulate"
DEPEND=""

S="${S}/tools/schemacode"

distutils_enable_tests pytest

python_test() {
	# Ideally we should package the testdata packages:
	# https://github.com/bids-standard/bids-examples
	# https://github.com/bids-standard/bids-error-examples
	export SCHEMACODE_TESTS_NONETWORK=1
	epytest
}
