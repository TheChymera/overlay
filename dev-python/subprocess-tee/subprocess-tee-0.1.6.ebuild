# Copyright 2020-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="An drop-in alternative to subprocess.run that captures the output 
while still printing it in real time, just the way tee does."
HOMEPAGE="https://github.com/pycontribs/subprocess-tee"
#SRC_URI="https://github.com/pycontribs/${PN}/archive/${PV}.tar.gz"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""
