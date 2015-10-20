# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python{2_7,3_4} )

inherit distutils-r1 git-r3

DESCRIPTION="A tool to plot brain activation"
EGIT_REPO_URI="https://github.com/poinu/actibrain44"
HOMEPAGE=""
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev_python/setuptools"
RDEPEND="dev_python/nilearn"
