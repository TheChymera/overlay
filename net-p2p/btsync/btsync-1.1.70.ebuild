# Copyright (C) 2013 Jonathan Vasquez 
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit systemd user

DESCRIPTION="Automatically sync files via secure, distributed technology."
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="
	amd64?	( http://syncapp.bittorrent.com/${PV}/${PN}_x64-${PV}.tar.gz )
	x86?	( http://syncapp.bittorrent.com/${PV}/${PN}_i386-${PV}.tar.gz )
	arm?	( http://syncapp.bittorrent.com/${PV}/${PN}_arm-${PV}.tar.gz )
	ppc?	( http://syncapp.bittorrent.com/${PV}/${PN}_powerpc-${PV}.tar.gz )"

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm ~ppc"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="opt/${PN}/${PN}"

S="${WORKDIR}"

pkg_setup() {
	enewgroup btsync
	enewuser btsync -1 -1 -1 "btsync,users"
}

src_install() {
	exeinto "/opt/${PN}"
	doexe btsync
	insinto "/etc/${PN}"
	doins "${FILESDIR}/config"
	doinitd "${FILESDIR}/init.d/${PN}"
	systemd_dounit "${FILESDIR}"/btsync.service
	fowners -R btsync:btsync /opt/${PN}
}
