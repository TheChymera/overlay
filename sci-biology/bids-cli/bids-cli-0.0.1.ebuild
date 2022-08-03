# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="BIDS Command Line Interface"
HOMEPAGE="https://github.com/TheChymera/bids-cli"
SRC_URI="https://github.com/TheChymera/bids-cli/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

DEPEND=""
RDEPEND="
	dev-python/argh[${PYTHON_USEDEP}]
	sci-biology/bidsschematools[${PYTHON_USEDEP}]
	"

src_prepare() {
	sed -i -e "s/version=\"9999\",/version=\"${PV}\",/g" setup.py || die
	default
}
