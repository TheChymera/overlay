# Copyright (C) 2013 Jonathan Vasquez 
# Distributed under the terms of the GNU General Public License v2

EAPI="4"

inherit systemd

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

QA_PREBUILT="opt/btsync/${PN}"

S="${WORKDIR}"

src_install() {
	mkdir -p ${D}/opt/${PN} && cd ${D}/opt/${PN}
	mkdir -p ${D}/etc/{init.d,${PN}}

	cp ${S}/btsync .
	cp ${S}/LICENSE.TXT .
	cp ${FILESDIR}/config ${D}/etc/${PN}
	cp ${FILESDIR}/init.d/${PN} ${D}/etc/init.d/

	# Set more secure permissions
	chmod 755 ${D}/etc/init.d/btsync
	systemd_dounit "${FILESDIR}"/${PN}.service
}