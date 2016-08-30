# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Organize and rename large numbers of files"
HOMEPAGE="https://github.com/TheChymera/SAMRI"
SRC_URI=""
EGIT_REPO_URI="https://github.com/TheChymera/SAMRI"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS=""

DEPEND=""
RDEPEND="
	sci-biology/dcmstack[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	sci-biology/fsl
	sci-biology/bru2nii
	sci-libs/nipype[${PYTHON_USEDEP}]
	"
