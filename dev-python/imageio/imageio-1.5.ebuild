# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_5 )

inherit distutils-r1

DESCRIPTION="Video editing with Python"
HOMEPAGE="https://imageio.github.io/"
SRC_URI="https://github.com/imageio/imageio/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	"
