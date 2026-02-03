# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GO_OPTIONAL=1
inherit go-module

DESCRIPTION="Terminal stock & crypto price watcher and position tracker"
HOMEPAGE="https://github.com/achannarasappa/ticker"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

SRC_URI="
	https://github.com/achannarasappa/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://resources.chymera.eu/distfiles/${P}-deps.tar.xz
"

src_compile() {
	local ldflags=(
		"-s -w"
		"-X main.version=${PV}"
		"-buildid="
	)
	ego build -trimpath -buildmode=pie -ldflags "${ldflags[*]}" -o "${PN}" .
}

src_install() {
	dobin "${PN}"
	dodoc README.md
	# Currently no example config
	# https://github.com/achannarasappa/ticker/issues/343
	#insinto /usr/share/${PN}
	#doins example.yaml
}
