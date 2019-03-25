# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils git-r3 multilib

DESCRIPTION="Advanced Normalitazion Tools for neuroimaging"
HOMEPAGE="http://stnava.github.io/ANTs/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/stnava/ANTs.git"

SLOT="0"
LICENSE="BSD"
KEYWORDS=""

DEPEND=">=dev-util/cmake-3.10.3"
RDEPEND=""

src_install() {
	cd "${WORKDIR}/${P}_build/ANTS-build" || die "build dir not found"
	default
	cd "${WORKDIR}/ANTs-${PV}/Scripts" || die "scripts dir not found"
	dobin *.sh
	dodir /usr/$(get_libdir)/ants
	install -t "${D}"usr/$(get_libdir)/ants *
	doenvd "${FILESDIR}"/99ants
}
