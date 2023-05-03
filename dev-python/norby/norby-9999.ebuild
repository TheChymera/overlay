# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..11} )

inherit distutils-r1
inherit git-r3

DESCRIPTION="Get notified via a telegram bot when your bash command finished."
HOMEPAGE="https://github.com/Jimmy2027/NORBY"
EGIT_REPO_URI="https://github.com/Jimmy2027/NORBY.git"
KEYWORDS="~amd64 ~x86"
LICENSE="GNU General Public License v3.0"
SLOT="0"
DEPEND="
    dev-python/requests[${PYTHON_USEDEP}]
	dev-python/subprocess-tee[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	"

RDEPEND="${DEPEND}"

src_unpack() { 
	git-r3_src_unpack 
} 
 
python_install_all() { 
    distutils-r1_python_install_all 
} 
