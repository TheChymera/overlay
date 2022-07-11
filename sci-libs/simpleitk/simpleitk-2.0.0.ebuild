# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
LUA_COMPAT=( lua5-{1..3} )

inherit lua-single toolchain-funcs cmake python-single-r1

MY_PN="SimpleITK"

DESCRIPTION="Layer on top of ITK for rapid prototyping, education and interpreted languages."
HOMEPAGE="https://simpleitk.org/"
SRC_URI="
	https://github.com/SimpleITK/SimpleITK/releases/download/v${PV}/SimpleITK-${PV}.tar.gz
	https://github.com/SimpleITK/SimpleITK/releases/download/v${PV}/SimpleITKData-${PV}.tar.gz
"
RESTRICT="primaryuri"

LICENSE="Apache-2.0"
SLOT="0"
# still working on 1.2.4 draft
KEYWORDS=""

IUSE="python tcl"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="dev-lang/swig"
RDEPEND="
	${LUA_DEPS}
	dev-cpp/gtest
	tcl? ( dev-lang/tk )
	sci-libs/itk
	dev-python/virtualenv
	python? ( ${PYTHON_DEPS} )
"
DEPEND="${RDEPEND}"

PATCHES=(
	#"${FILESDIR}/${PN}-1.2.4-module.patch"
	#"${FILESDIR}/${PN}-1.2.4-int-cast.patch"
)

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	cmake_src_prepare
	cp -rf "../${MY_PN}-${PV}/.ExternalData" "${BUILD_DIR}/" || die
}

src_configure() {
	local mycmakeargs=(
		-DWRAP_DEFAULT:BOOL=OFF
		-DWRAP_TCL:BOOL=$(usex tcl)
		-DWRAP_PYTHON:BOOL=$(usex python)
		-DBUILD_TESTING:BOOL=OFF
		-DSimpleITK_FORBID_DOWNLOADS=ON
		-DSimpleITK_PYTHON_USE_VIRTUALENV:BOOL=OFF
		-DSimpleITK_EXPLICIT_INSTANTIATION=OFF
		-DExternalData_OBJECT_STORES:STRING="${BUILD_DIR}/.ExternalData"
		-DSimpleITK_INSTALL_LIBRARY_DIR=$(get_libdir)
		-DSimpleITK_LUA_EXECUTABLE:PATH=/usr/bin/lua5.1
		-DLUA_EXECUTABLE:PATH=/usr/bin/lua5.1
	)
	cmake_src_configure
}
#		-DUSE_SYSTEM_VIRTUALENV=ON
#		-DModule_SimpleITKFilters:BOOL=ON
#		-DUSE_SYSTEM_GTEST=ON
#		-DUSE_SYSTEM_ITK=ON
#		-DUSE_SYSTEM_LUA=ON
#		-DUSE_SYSTEM_SWIG=ON

#src_install() {
#	die
#}
