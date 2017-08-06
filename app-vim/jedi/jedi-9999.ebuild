# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_4 )

inherit vim-plugin git-r3 python-r1 python-utils-r1

DESCRIPTION="Jedi Python autocompletion with VIM"
HOMEPAGE="https://github.com/davidhalter/jedi-vim"
SRC_URI=""
EGIT_REPO_URI="git://github.com/davidhalter/${PN}-vim.git"

LICENSE="MIT"
KEYWORDS=""
IUSE=""

RDEPEND="dev-python/jedi[${PYTHON_USEDEP}]"
DEPEND="app-editors/vim[python]"

#Makeflile calls tests, which are broken.
src_compile() { :; }

src_install() {
	python_foreach_impl python_domodule jedi_vim.py
	vim-plugin_src_install
}
