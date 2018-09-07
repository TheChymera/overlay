# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1 git-r3

DESCRIPTION="Neuroimaging tools for Python"
HOMEPAGE="http://nipy.org/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/daducci/AMICO"

LICENSE="BSD"
SLOT="0"
IUSE=""
KEYWORDS=""

DEPEND="sci-biology/dipy[${PYTHON_USEDEP}]"
RDEPEND="
	sci-libs/spams-python[${PYTHON_USEDEP}]
	${DEPEND}
	"
