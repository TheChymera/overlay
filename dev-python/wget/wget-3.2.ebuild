# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python{2_7,3_{6,7,8,9,10}} )

inherit distutils-r1

DESCRIPTION="pure python download utility"
HOMEPAGE="https://pypi.python.org/pypi/wget"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="${PYTHON_DEPEND}"
RDEPEND="${DEPEND}"
