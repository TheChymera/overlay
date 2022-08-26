# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9,10} )
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Efficiently process 3D images in deep learning applications."
HOMEPAGE="https://torchio.readthedocs.io/"
SRC_URI="https://github.com/fepegar/torchio/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
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
	sci-libs/pytorch[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	')
	sci-libs/simpleitk[${PYTHON_SINGLE_USEDEP}]
"

RDEPEND="${DEPEND}"

distutils_enable_tests pytest
