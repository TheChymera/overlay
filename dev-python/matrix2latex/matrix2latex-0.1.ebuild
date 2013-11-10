# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/pdf2djvu/pdf2djvu-0.7.17.ebuild,v 1.3 2013/09/12 21:16:00 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-single-r1 toolchain-funcs

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
