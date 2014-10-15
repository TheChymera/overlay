# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:$

EAPI="5"

inherit eutils base systemd

DESCRIPTION="Open, trustworthy and decentralized syncing engine (some kind of analog of DropBox and BTSync)"
HOMEPAGE="http://syncthing.net"
SRC_URI="https://github.com/syncthing/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

DEPEND="
	dev-lang/go
	app-misc/godep
"
RDEPEND="${DEPEND}"

DOCS=( README.md CONTRIBUTORS LICENSE CONTRIBUTING.md )

export GOPATH="${S}"

GO_PN="github.com/syncthing/${PN}"
S="${S}/src/${GO_PN}"

src_unpack() {
	mkdir -p ${S} || die
	unpack ${A}

	cd ${WORKDIR}/${P}
	# Move everything except src (cannot move it to itself) to ${S}
	mv `ls | grep -v '^src$'` ${S} || die
}

src_compile() {
	local version="v${PV}";
	local date="$(date +%s)";
	local user="$(whoami)"
	local host="$(hostname)"; host="${host%%.*}";
	local lf="-w -X main.Version ${version} -X main.BuildStamp ${date} -X main.BuildUser ${user} -X main.BuildHost ${host}"

	godep go build -ldflags "${lf}" -tags noupgrade ./cmd/syncthing || die
}

src_install() {
	dobin syncthing
	systemd_newunit "${FILESDIR}"/syncthing.service syncthing@.service
	base_src_install_docs
}

pkg_postinst() {
	ewarn "To run syncthing as a service, execute"
	ewarn "  systemctl start syncthing@<user>"
}
