# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Personal Pastebin"
HOMEPAGE="https://github.com/TheChymera/quickscreenvid"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/TheChymera/quickscreenvid.git"
	inherit git-r3
else
	SRC_URI="https://github.com/TheChymera/quickscreenvid/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/quickscreenvid-${PV}"
fi

LICENSE="MIT"
SLOT="0"

DEPEND=""
RDEPEND="
	gui-apps/slurp
	gui-apps/wf-recorder
"
RESTRICT="test"

src_install() {
	dobin "bin/quickscreenvid.sh"
	dobin "bin/quickscreenvid_kill.sh"
}
