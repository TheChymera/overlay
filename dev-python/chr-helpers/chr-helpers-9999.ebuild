# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-tex/envlab/envlab-1.2-r1.ebuild,v 1.18 2012/05/09 17:16:08 aballier Exp $

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3} )

inherit python-single-r1 git-2

DESCRIPTION="Helper Functions for TheChymera's python scripts"
HOMEPAGE="https://github.com/TheChymera/chr-helpers"
EGIT_REPO_URI="https://github.com/TheChymera/chr-helpers.git"
SRC_URI=""


SLOT="0"
LICENSE="LPPL-1.3 BSD"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""

RDEPEND="dev-python/pandas"

src_install() {
	python_optimize .
	python_domodule "${S}"/chr_helpers.py 
	python_domodule "${S}"/chr_matplotlib.py
}


