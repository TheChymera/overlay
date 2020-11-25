# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5..9} )

inherit distutils-r1

DESCRIPTION="Reormat text as alternating lower and upper case letters"
HOMEPAGE="https://github.com/Othyem86/sarcasm-formatter"
SRC_URI="https://github.com/Othyem86/sarcasm-formatter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
	dev-python/argh[${PYTHON_USEDEP}]
"
