# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit golang-build

EGO_PN="github.com/oniony/TMSU/"
DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/oniony/TMSU/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-go/go-sqlite3
	dev-libs/go-fuse
	"
DEPEND="dev-lang/go"

S=${WORKDIR}/TMSU-${PV}

RESTRICT="test"

src_compile() {
	GOPATH="${S}:$(get_golibdir_gopath)" \
		go install -v -work -x ${EGO_BUILD_FLAGS} ${EGO_PN} || die
}

src_install() {
	golang_install_pkgs
	newbin bin/TMSU tmsu
}
