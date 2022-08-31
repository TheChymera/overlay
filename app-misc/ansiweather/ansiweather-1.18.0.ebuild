# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Weather in terminal, with ANSI colors and Unicode symbols"
HOMEPAGE="https://github.com/fcambus/ansiweather"
SRC_URI="https://github.com/fcambus/ansiweather/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="
	app-misc/jq
	sys-devel/bc
"
BDEPEND=""

src_install() {
	dobin "${PN}"

	doman "${PN}.1"

	einstalldocs
	dodoc 'ansiweatherrc.example'

	insinto /usr/share/zsh/site-functions
	newins ansiweather.plugin.zsh -ansiweather
}
