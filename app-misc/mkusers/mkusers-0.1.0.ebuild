# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Bulk linux user creation and removal."
HOMEPAGE="https://github.com/TheChymera/mkusers"
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="https://github.com/TheChymera/mkusers.git"
	inherit git-r3
else
	SRC_URI="https://github.com/TheChymera/mkusers/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
# https://github.com/TheChymera/mkusers/issues/1
RESTRICT="test"

src_install() {
	exeinto /usr/bin/
	newexe "${S}"/bin/mkusers.sh mkusers
}

src_test() {
	bats -r test/* || die
}
