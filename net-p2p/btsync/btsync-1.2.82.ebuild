# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils pax-utils user flag-o-matic multilib autotools pam systemd versionator

DESCRIPTION="Sync stuff via BitTorrent"
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

QA_PREBUILT="usr/bin/btsync"


src_install() {
	dodoc "${S}"/LICENSE.TXT

	newconfd "${FILESDIR}/btsync_confd" btsync
	"{S}/btsync" --dump-sample-config | sed 's:/home/user/\.sync:/var/lib/btsync:g' > "btsync.conf"
	insinto /etc
	doins "btsync.conf"
	
	# system-v-init support
	newinitd "${FILESDIR}/btsync_initd" btsync
	
	# systemd support
	systemd_dounit "${FILESDIR}/btsync.service"
	systemd_newunit "${FILESDIR}/btsync.service" 'btsync.service'
	systemd_dounit "${FILESDIR}/btsync@.service"
	systemd_newunit "${FILESDIR}/btsync@.service" 'btsync@.service'
	systemd_dounit "${FILESDIR}/btsync_user.service"
	systemd_newunit "${FILESDIR}/btsync_user.service" 'btsync_user.service'
	into /usr/
	dobin btsync
}

pkg_preinst() {
	enewgroup btsync
	enewuser btsync -1 /bin/false /dev/null btsync
	dodir "/run/btsync"
	fowners btsync:btsync "/run/btsync"
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
