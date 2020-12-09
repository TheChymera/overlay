# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1
inherit git-r3

DESCRIPTION="Get notified via a telegram bot when your bash command finished."
HOMEPAGE="https://github.com/Jimmy2027/NORBY"
#SRC_URI="https://github.com/Jimmy2027/NORBY/archive/${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/Jimmy2027/NORBY.git"
KEYWORDS="~amd64 ~x86"
LICENSE="GNU General Public License v3.0"
SLOT="0"
DEPEND="
    dev-python/requests
	"

RDEPEND="${DEPEND}"

src_unpack() { 
	git-r3_src_unpack 
} 
 
python_install_all() { 
    distutils-r1_python_install_all 
} 
