# Distributed under the terms of the GNU General Public License v3

EAPI=5

PYTHON_COMPAT=( python{2_7,3_2,3_3,3_4} )

inherit python-r1 git-2

DESCRIPTION="Python script that creates tile-based visual art. "
HOMEPAGE="https://github.com/TheChymera/${PN}"
EGIT_REPO_URI="https://github.com/TheChymera/${PN}.git"
SRC_URI=""


SLOT="0"
LICENSE="LPPL-1.3 BSD"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="dev-python/pandas"

src_install() {
	python_foreach_impl python_optimize .
	python_foreach_impl python_domodule "${S}"/"${PN}".py
	python_foreach_impl python_newscript "${S}"/"${PN}"_cli.py "${PN}"_cli
}


