# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
LUA_COMPAT=( lua5-1 )

inherit lua-single toolchain-funcs cmake python-r1
#distutils-r1
#python-single-r1

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
KEYWORDS="~amd64 ~x86"

# tcl currently fails: https://github.com/SimpleITK/SimpleITK/issues/1348
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
	"${FILESDIR}/${P}-module.patch"
	"${FILESDIR}/${P}-int-cast.patch"
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

src_install() {
	pwd
	ls -lah
	echo "${BUILD_DIR}"
	cd "../${P}_build" || die
	pushd Wrapping/Python > /dev/null || die
		pwd
		echo "Doing "python Packaging/setup.py install" here"
		#1
		#python Packaging/setup.py install || die
		cd Packaging || die
		esetup.py install || die
	popd > /dev/null || die
	#pushd ../${P}_build/Wrapping/Python > /dev/null || die
	#	python Packaging/setup.py install
	#popd > /dev/null || die
	#pwd
	#ls -lah
	#die
}
