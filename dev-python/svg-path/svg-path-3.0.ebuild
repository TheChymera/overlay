# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1

MY_PN="svg.path"

DESCRIPTION="SVG path objects and parser"
HOMEPAGE="https://github.com/regebro/svg.path"
SRC_URI="https://github.com/regebro/svg.path/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

python_test() {
	${EPYTHON} setup.py test || die
}

python_install() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}
