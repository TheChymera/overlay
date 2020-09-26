# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1 git-r3

DESCRIPTION="This is a tool to quickly preview nifti images on the terminal"
HOMEPAGE="https://github.com/wasserth/niicat"
SRC_URI=""
EGIT_REPO_URI="https://github.com/wasserth/niicat"
EGIT_COMMIT="be61c2f1a752ef14e62c4239de11ca5561360f2e"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=sci-libs/nibabel-2.3.0[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	media-libs/libsixel[python]
"

PATCHES=( "${FILESDIR}/libsixel.patch" )
