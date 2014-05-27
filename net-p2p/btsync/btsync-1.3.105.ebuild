# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils pax-utils user flag-o-matic multilib autotools pam systemd versionator

DESCRIPTION="Sync files & folders using BitTorrent protocol"
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="amd64? ( http://syncapp.bittorrent.com/${PV}/${PN}_x64-${PV}.tar.gz )
	x86? ( http://syncapp.bittorrent.com/${PV}/${PN}_i386-${PV}.tar.gz )
	ppc? ( http://syncapp.bittorrent.com/${PV}/${PN}_powerpc-${PV}.tar.gz )
	arm? ( http://syncapp.bittorrent.com/${PV}/${PN}_arm-${PV}.tar.gz )"

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="amd64 ~x86 ~arm ~ppc"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PREBUILT="/opt/${PN}/"

src_install() {
	dodoc "${S}"/LICENSE.TXT

	doconfd "${FILESDIR}/conf.d/${PN}"
	"${S}/${PN}" --dump-sample-config | sed 's:/home/user/\.sync:/var/lib/btsync:g' > "${PN}.conf"
	insinto /etc
	doins "${PN}.conf"
	
	# system-v-init support
	doinitd "${FILESDIR}/init.d/${PN}"
	
	# systemd support
	systemd_dounit "${FILESDIR}/btsync.service"
	systemd_dounit "${FILESDIR}/btsync@.service"
	systemd_dounit "${FILESDIR}/btsync_user.service"

	exeinto "/opt/${PN}/"
	doexe "${PN}"
}

pkg_preinst() {
	enewgroup "${PN}"
	enewuser "${PN}" -1 -1 /dev/null "${PN}"
	dodir "/run/${PN}"
	fowners "${PN}":"${PN}" "/run/${PN}"
}

pkg_postinst() {
einfo "Auto-generated configuration file is located at /etc/btsync.conf"
einfo "(use this file as a template for user-level privilege service units)"
einfo ""
einfo "systemd"
einfo "btsync.service:"
einfo " run as a system service as user/group btsync:btsync"
einfo " use /var/lib/btsync for btsync working data"
einfo "btsync@<user>.service"
einfo " run as a system service but with user privilege"
einfo " use /home/<user>/.config/btsync/btsync.conf for btsync working data"
einfo "btsync_user.service"
einfo " run as a standard user service"
einfo " use /home/<user>/.config/btsync/btsync.conf for btsync working data"
einfo ""
einfo "Ensure you open the following ports in your firewall:"
einfo " btsync.conf specified listening port (UDP/TCP)"
einfo " port 3838 (UDP) for DHT tracking"
}
