# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python{2_7,3_3})
inherit vim-plugin git-2 python-r1 python-utils-r1

DESCRIPTION="Jedi Python autocompletion with VIM"
HOMEPAGE="https://github.com/davidhalter/jedi-vim"
SRC_URI=""
EGIT_REPO_URI="git://github.com/davidhalter/${PN}-vim.git"

LICENSE="LGPL-3+"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/jedi[${PYTHON_USEDEP}]"
DEPEND="app-editors/vim[${PYTHON_USEDEP},python]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare() {
	python_copy_sources
}

src_install() {
	python_foreach_impl python_domodule jedi_vim.py
	vim-plugin_src_install
}
