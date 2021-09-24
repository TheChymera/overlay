# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{8..10} )
inherit distutils-r1

MY_PN="keyrings.alt"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Alternate keyring backend implementations used with dev-python/keyring"
HOMEPAGE="https://github.com/jaraco/keyrings.alt/"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="PSF-2"
KEYWORDS="~alpha ~amd64 ~arm ~arm64"

RDEPEND=""
BDEPEND=""

S="${WORKDIR}/${MY_P}"

distutils_enable_tests pytest
distutils_enable_sphinx docs

#EPYTEST_DESELECT=(
#	# this test fails if importlib-metadata returns more than one
#	# entry, i.e. when keyring is installed already
#	tests/test_packaging.py::test_entry_point
#)
#
#EPYTEST_IGNORE=(
#	# apparently does not unlock the keyring properly
#	tests/backends/test_libsecret.py
#	# hangs
#	tests/backends/test_kwallet.py
#)
