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
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

QA_PREBUILT="opt/${PN}/${PN}"

S="${WORKDIR}"

pkg_setup() {
	enewgroup btsync
}

src_install() {
	exeinto "/opt/${PN}"
	doexe btsync
	insinto "/etc/${PN}"
	doins "${FILESDIR}/btsync.conf"
	doinitd "${FILESDIR}/init.d/${PN}"
	cp ${FILESDIR}/btsync.service ${D}/btsync@.service
	systemd_dounit "${D}/btsync@.service"
	mkdir ${D}/opt/${PN}/pid/
	fowners -R root:btsync /opt/${PN}
	fperms -R 775 /opt/${PN}
}

pkg_postinst() {
ewarn "You have to add your user to the btsync group to use btsync.
Do this by running the following command from a root terminal:

	usermod -a -G btsync your_user

If you are using systemd you should start the service per user:

	systemctl start btsync@your_user

You may also tell your system to automatically launch btsync:

	systemctl enable btsync@your_user

You may access the web-GUI at localhost:8888.
 
"
}
