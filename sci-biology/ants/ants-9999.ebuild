# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3 multilib

MY_HASH="84cf0e06646142e0aa4c3d3324a62701"

DESCRIPTION="Advanced Normalitazion Tools for neuroimaging"
HOMEPAGE="http://stnava.github.io/ANTs/"
SRC_URI="http://slicer.kitware.com/midas3/api/rest?method=midas.bitstream.download&checksum=${MY_HASH} -> ${MY_HASH}"
EGIT_REPO_URI="https://github.com/stnava/ANTs.git"
#EGIT_COMMIT="1d2e5bf497cd71667d6f7d79ff858387c08bb93e"

SLOT="0"
LICENSE="BSD"
KEYWORDS=""
IUSE="test"

DEPEND=">=dev-util/cmake-3.10.3"
RDEPEND="
	sci-libs/vtk
	>=sci-libs/itk-5.0_rc1
	"

#S="${WORKDIR}/ANTs-${PV}"

src_prepare() {
	pwd
	ln -s
	die
}

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
	cd "${WORKDIR}/${P}/Scripts" || die "scripts dir not found"
	dobin *.sh
	dodir /usr/$(get_libdir)/ants
	install -t "${D}"usr/$(get_libdir)/ants *
	doenvd "${FILESDIR}"/99ants
}
