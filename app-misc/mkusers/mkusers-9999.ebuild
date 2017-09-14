# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit git-r3

DESCRIPTION="Automatically Create a Large Amount of Users on a Linux System."
HOMEPAGE="https://github.com/TheChymera/mkusers"
EGIT_REPO_URI="https://github.com/TheChymera/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	exeinto /usr/bin/
	newexe "${S}"/mkusers.sh mkusers
}
