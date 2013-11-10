# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-single-r1

DESCRIPTION="A tool to create LaTeX tables from python lists and arrays."
HOMEPAGE="https://code.google.com/p/matrix2latex/"
SRC_URI="https://matrix2latex.googlecode.com/files/"${PN}"Python2011-12-15.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND=""

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
	S="${WORKDIR}/${PN}Python"
	cd ${S}
}

src_install() {
	python_optimize .
	python_domodule "${S}"/matrix2latex.py
	python_domodule "${S}"/fixEngineeringNotation.py
	python_domodule "${S}"/error.py
	python_domodule "${S}"/IOString.py
}
