# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 git-r3

DESCRIPTION="A Python library for working with the BIDS schema"
HOMEPAGE="https://github.com/bids-standard/bids-specification"
EGIT_REPO_URI="git@github.com:TheChymera/bids-specification.git"
EGIT_BRANCH="release_candidate"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/tabulate"
DEPEND=""

S="${WORKDIR}/bids-specification-${MY_HASH}/tools/schemacode"

distutils_enable_tests pytest

python_test() {
	# Ideally we should package the testdata packages:
	# https://github.com/bids-standard/bids-examples
	# https://github.com/bids-standard/bids-error-examples
	export SCHEMACODE_TESTS_NONETWORK=1
	epytest
}
