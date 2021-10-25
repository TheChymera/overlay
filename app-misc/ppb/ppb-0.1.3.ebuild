# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Personal Pastebin"
HOMEPAGE="https://github.com/TheChymera/ppb"
SRC_URI="https://github.com/TheChymera/PPB/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-text/ansifilter"
RDEPEND=""

S="${WORKDIR}/PPB-${PV}"

src_install() {
	dobin "bin/ppb"

	insinto "/etc/"
	doins config/ppb.conf
}
