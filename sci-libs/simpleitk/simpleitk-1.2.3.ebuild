# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )

inherit toolchain-funcs cmake python-single-r1

MY_PN="SimpleITK"

DESCRIPTION="Layer on top of ITK for rapid prototyping, education and interpreted languages."
HOMEPAGE="https://simpleitk.org/"
#SRC_URI="https://github.com/SimpleITK/SimpleITK/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/SimpleITK/SimpleITK/releases/download/v${PV}/SimpleITK-${PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="python"

# According to upstream it should be dev-lang/lua:5.3 , but that is hard masked.
# Let's hope for the best!
RDEPEND="
	dev-lang/lua:0
	dev-lang/swig
	dev-cpp/gtest
	sci-libs/itk
	dev-python/virtualenv
"
DEPEND="${RDEPEND}"

#REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

#PATCHES=(
#	${FILESDIR}/0dfae3e_reversed.patch
#	${FILESDIR}/77a3d89_reversed.patch
#)

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	local mycmakeargs=(
		-DUSE_SYSTEM_LUA=ON
		-DUSE_SYSTEM_SWIG=ON
		-DUSE_SYSTEM_GTEST=ON
		-DUSE_SYSTEM_ITK=ON
		-DUSE_SYSTEM_VIRTUALENV=ON
		-DSimpleITK_PYTHON_USE_VIRTUALENV:BOOL=OFF
	)
		#-DITK_INSTALL_LIBRARY_DIR=$(get_libdir)
		#-DBUILD_SHARED_LIBS=ON
		#-DGDCM_USE_SYSTEM_OPENJPEG=ON
		#-DITK_FORBID_DOWNLOADS:BOOL=OFF
		#-DITK_USE_SYSTEM_DCMTK=ON
		#-DITK_USE_SYSTEM_DOUBLECONVERSION=ON
		#-DITK_USE_SYSTEM_CASTXML=ON
		#-DITK_USE_SYSTEM_HDF5=ON
		#-DITK_USE_SYSTEM_JPEG=ON
		#-DITK_USE_SYSTEM_PNG=ON
		#-DITK_USE_SYSTEM_SWIG=ON
		#-DITK_USE_SYSTEM_TIFF=ON
		#-DITK_USE_SYSTEM_ZLIB=ON
		#-DITK_USE_KWSTYLE=OFF
		#-DITK_BUILD_DEFAULT_MODULES=ON
		#-DITK_COMPUTER_MEMORY_SIZE="${ITK_COMPUTER_MEMORY_SIZE:-1}"
		#-DWRAP_ITK_JAVA=OFF
		#-DWRAP_ITK_TCL=OFF
		#-Ddouble-conversion_INCLUDE_DIRS="${EPREFIX}/usr/include/double-conversion"
		#-DExternalData_OBJECT_STORES="${WORKDIR}/InsightToolkit-${PV}/.ExternalData"
		#-DModule_GenericLabelInterpolator:BOOL=ON
		#-DModule_ITKReview:BOOL=ON
	#-DBUILD_EXAMPLES="$(usex examples ON OFF)"
	#-DITK_USE_REVIEW="$(usex review ON OFF)"
	#-DBUILD_TESTING="$(usex test ON OFF)"
	#if use python; then
	#   mycmakeargs+=(
	#	   -DITK_WRAP_PYTHON=ON
	#	   -DITK_WRAP_DIMS="${ITK_WRAP_DIMS:-2;3}"
	#   )
	#else
	#   mycmakeargs+=(
	#	   -DITK_WRAP_PYTHON=OFF
	#   )
	#fi
	cmake_src_configure
}

#src_install() {
#   cmake-utils_src_install
#
#   if use examples; then
#	   insinto /usr/share/doc/${PF}/examples
#	   docompress -x /usr/share/doc/${PF}/examples
#	   doins -r "${S}"/Examples/*
#   fi
#
#   echo "ITK_DATA_ROOT=${EROOT%/}/usr/share/${PN}/data" > ${T}/40${PN}
#   local ldpath="${EROOT%/}/usr/$(get_libdir)/InsightToolkit"
#   if use python; then
#	   echo "PYTHONPATH=${EROOT%/}/usr/$(get_libdir)/InsightToolkit/WrapITK/Python" >> "${T}"/40${PN}
#	   ldpath="${ldpath}:${EROOT%/}/usr/$(get_libdir)/InsightToolkit/WrapITK/lib"
#   fi
#   echo "LDPATH=${ldpath}" >> "${T}"/40${PN}
#   doenvd "${T}"/40${PN}
#
#   if use doc; then
#	   insinto /usr/share/doc/${PF}/api-docs
#	   cd "${WORKDIR}"/html
#	   rm  *.md5 || die "Failed to remove superfluous hashes"
#	   einfo "Installing API docs. This may take some time."
#	   insinto /usr/share/doc/${PF}/api-docs
#	   doins -r *
#   fi
#}
