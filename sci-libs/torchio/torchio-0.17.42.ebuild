# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="A set of tools to efficiently read, preprocess, sample, augment, and write 3D medical images in deep learning applications."
HOMEPAGE="https://torchio.readthedocs.io/"
SRC_URI="https://github.com/fepegar/torchio/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"
LICENSE="MIT license"
SLOT="0"
IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
DEPEND="
    $(python_gen_cond_dep '
    dev-python/click[${PYTHON_USEDEP}]
    dev-python/humanize[${PYTHON_USEDEP}]
    sci-libs/nibabel[${PYTHON_USEDEP}]
    dev-python/numpy[${PYTHON_USEDEP}]
    dev-python/deprecation[${PYTHON_USEDEP}]
    dev-python/scipy[${PYTHON_USEDEP}]
    >=sci-libs/pytorch-1.1[${PYTHON_USEDEP}]
    dev-python/tqdm[${PYTHON_USEDEP}]
    ')
    sci-libs/simpleitk[${PYTHON_SINGLE_USEDEP}]
"

RDEPEND="${DEPEND}"

distutils_enable_tests pytest
