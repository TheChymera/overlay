# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A Python publish-subcribe library"
HOMEPAGE="https://github.com/schollii/pypubsub/"
SRC_URI="
	https://github.com/schollii/pypubsub/archive/v${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="test? (	dev-python/pytest[${PYTHON_USEDEP}] )"

python_test() {
	distutils_install_for_testing
	cd "tests/suite" || die
	pytest -vv || die
}
