# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Reormat text as alternating lower and upper case letters"
HOMEPAGE="https://github.com/TheChymera/sarcasm-formatter"
SRC_URI="https://github.com/TheChymera/sarcasm-formatter/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	newbin bin/sarcasm.sh sarcasm
	einstalldocs
}

src_test() {
	bats --verbose-run -r test/* || die
}
