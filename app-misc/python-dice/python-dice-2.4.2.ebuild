# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Dice parsing and evaluation library"
HOMEPAGE="https://github.com/borntyping/python-dice"
SRC_URI="https://github.com/borntyping/python-dice/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="test"
# Tests do not run, which may be an upstream issue:
# https://github.com/borntyping/python-dice/issues/25

DEPEND="test? (
	dev-python/coverage[${PYTHON_USEDEP}]
	dev-python/pyflakes[${PYTHON_USEDEP}]
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/pytest-cov[${PYTHON_USEDEP}]
	dev-python/pytest-flakes[${PYTHON_USEDEP}]
	dev-python/pytest-pep8[${PYTHON_USEDEP}]
	dev-python/termcolor[${PYTHON_USEDEP}]
	dev-python/tox[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	dev-python/docopt[${PYTHON_USEDEP}]
	>=dev-python/pyparsing-2.4.1[${PYTHON_USEDEP}]
"

src_prepare() {
	if use test; then
		sed -i -e "s/pytest<3.7.0/pytest/g" tox.ini
	fi
	default
}

python_test() {
	#pytest -vv || die
	tox || die "tests failed under ${EPYTHON}"
}
