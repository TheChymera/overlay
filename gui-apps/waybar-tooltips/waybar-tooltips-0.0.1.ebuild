# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
inherit python-r1

DESCRIPTION="Tooltips for Waybar"
HOMEPAGE="https://github.com/TheChymera/waybar-tooltips/"
SRC_URI="https://github.com/TheChymera/waybar-tooltips/archive/refs/tags/0.0.1.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
IUSE="khal weather"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
SLOT="0"

RDEPEND="
	${PYTHON_DEPS}
	media-fonts/fontawesome
	khal? (
		app-misc/khal[${PYTHON_USEDEP}]
	)
	weather? (
		app-misc/ansiweather
	)
"

khal_python_install() {
	python_doscript "${S}/bin/waybar-tooltip-khal.py"
}

src_install() {
	if use khal; then
	    python_foreach_impl khal_python_install
	fi
	if use weather; then
		dobin "${S}/bin/waybar-tooltip-weather"
	fi
}
