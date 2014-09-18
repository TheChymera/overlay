# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# Author: Horea Christian

EAPI="5"

inherit git-2

RESTRICT="strip"

DESCRIPTION="Bash Utility for Creating Stage 4 Tarballs"
HOMEPAGE="https://github.com/TheChymera/${PN}"
EGIT_REPO_URI="https://github.com/TheChymera/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
	app-arch/tar"


src_install() {
	exeinto /usr/bin/ 
	newexe "${S}"/mkstage4.sh mkstage4
}
