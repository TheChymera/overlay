# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python{3_5,3_6} )

inherit bash-completion-r1 distutils-r1 git-r3

DESCRIPTION="This module is a python wrapper of libsixel. "
HOMEPAGE="https://github.com/saitoha/libsixel/python"
SRC_URI=""
EGIT_REPO_URI="https://github.com/saitoha/libsixel/python"
EGIT_COMMIT="eece94cc124943daa3c2511f2358f107ef4235b0"

LICENSE="MIT public-domain"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86"
IUSE="curl gd gtk jpeg png static-libs"

RDEPEND="
	media-libs/libsixel
"
