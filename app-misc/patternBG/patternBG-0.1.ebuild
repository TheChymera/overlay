# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit python-r1

DESCRIPTION="Python script that creates tile-based visual art."
HOMEPAGE="https://github.com/TheChymera/patternBG"
SRC_URI="https://github.com/TheChymera/patternBG/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="dev-python/pandas"

src_install() {
	python_foreach_impl python_optimize .
	python_foreach_impl python_domodule "${S}"/"${PN}".py
	python_foreach_impl python_newscript "${S}"/"${PN}"_cli.py "${PN}"_cli
}
