# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="This is a tool to quickly preview nifti images on the terminal"
HOMEPAGE="https://github.com/wasserth/niicat"
SRC_URI=""
EGIT_REPO_URI="https://github.com/wasserth/niicat"
EGIT_COMMIT="e4195584828e6af4f5d0efa6c2e551df9d94a99b"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux" #???
IUSE="doc test" #???

RDEPEND="
	>=sci-libs/nibabel-2.3.0[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	media-libs/libsixel
"
