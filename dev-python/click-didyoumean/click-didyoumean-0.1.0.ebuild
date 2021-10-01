# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{8..10} )
DISTUTILS_USE_SETUPTOOLS=pyproject.toml
inherit distutils-r1

DESCRIPTION="Enable git-like did-you-mean feature in click"
HOMEPAGE="https://github.com/click-contrib/click-didyoumean"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
#RESTRICT="test"
# Tests actually pass, but not included in archive:
# https://github.com/click-contrib/click-didyoumean/issues/11
DEPEND="
	dev-python/click
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
