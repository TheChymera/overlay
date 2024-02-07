# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Personal Pastebin"
HOMEPAGE="https://github.com/TheChymera/ppb"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/TheChymera/PPB.git"
	inherit git-r3
else
	SRC_URI="https://github.com/TheChymera/PPB/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/PPB-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="app-text/ansifilter"
# Only functionality relies on target server.
RESTRICT="test"

src_install() {
	dobin "bin/ppb"
	dobin "bin/rppb"

	insinto "/etc/"
	doins config/ppb.conf
}
