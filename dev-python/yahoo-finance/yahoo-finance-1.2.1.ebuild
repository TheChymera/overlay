# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Python module to get stock data from Yahoo! Finance"
HOMEPAGE="https://github.com/lukaszbanasiak/yahoo-finance"
SRC_URI="https://github.com/lukaszbanasiak/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	"
DEPEND="
	test? (
		${RDEPEND}
		dev-python/unittest2[${PYTHON_USEDEP}]
		)
	"

python_test() {
	${EPYTHON} test/test_yahoo.py || die
}
