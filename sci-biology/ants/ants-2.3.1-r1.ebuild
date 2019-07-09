# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils multilib

DESCRIPTION="Advanced Normalitazion Tools for neuroimaging"
HOMEPAGE="http://stnava.github.io/ANTs/"
SRC_URI="https://github.com/ANTsX/ANTs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=">=dev-util/cmake-3.10.3"
RDEPEND="
	sci-libs/vtk
	>=sci-libs/itk-5.0_rc1
	"

S="${WORKDIR}/ANTs-${PV}"

src_configure() {
	local mycmakeargs=(
		-DITK_DIR="/usr/include/ITK-5.0/"
		-DUSE_SYSTEM_ITK=ON
		-DUSE_SYSTEM_VTK=ON
		-DBUILD_TESTING="$(usex test ON OFF)"
	)
	cmake-utils_src_configure
}

src_install() {
	cd "${WORKDIR}/${P}_build/ANTS-build" || die "build dir not found"
	default
	cd "${S}/Scripts" || die "scripts dir not found"
	dobin *.sh
	dodir /usr/$(get_libdir)/ants
	install -t "${D}"usr/$(get_libdir)/ants *
	doenvd "${FILESDIR}"/99ants
}
