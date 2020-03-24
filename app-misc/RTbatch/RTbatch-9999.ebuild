# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_{6,7} )

inherit python-r1 git-r3

DESCRIPTION="Python script for batch porcessing in RawTherapee."
HOMEPAGE="https://github.com/TheChymera/RTbatch"
EGIT_REPO_URI="https://github.com/TheChymera/RTbatch.git"
SRC_URI=""

SLOT="0"
LICENSE="LPPL-1.3 BSD"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND=""
RDEPEND="dev-python/pandas"

src_install() {
	python_foreach_impl python_optimize .
	python_foreach_impl python_domodule "${S}"/RTbatch.py
	python_foreach_impl python_newscript "${S}"/RTbatch_cli.py RTbatch_cli
}
