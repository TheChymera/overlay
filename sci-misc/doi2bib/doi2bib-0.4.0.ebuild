# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Get the bibtex string given a DOI"
HOMEPAGE="https://github.com/bibcure/doi2bib"
SRC_URI="https://github.com/bibcure/doi2bib/archive/refs/tags/0.4.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"
#no test suite :(

RDEPEND="
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/bibtexparser[${PYTHON_USEDEP}]
"
