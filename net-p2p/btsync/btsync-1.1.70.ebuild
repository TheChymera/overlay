# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit pax-utils

DESCRIPTION="Sync stuff via BitTorrent"
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="amd64? ( http://syncapp.bittorrent.com/${PV}/${PN}_x64-${PV}.tar.gz )
	x86? ( http://syncapp.bittorrent.com/${PV}/${PN}_i386-${PV}.tar.gz )
	ppc? ( http://syncapp.bittorrent.com/${PV}/${PN}_powerpc-${PV}.tar.gz )
	arm? ( http://syncapp.bittorrent.com/${PV}/${PN}_arm-${PV}.tar.gz )"

RESTRICT="mirror"

LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~ppc"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PREBUILT="usr/bin/btsync"

src_install() {
	dodoc LICENSE.TXT

	newinitd "${FILESDIR}/btsync_initd" btsync
	newconfd "${FILESDIR}/btsync_confd" btsync

	insinto /etc
	doins "${FILESDIR}/btsync.conf"

	mkdir -p "${D}/usr/bin"
	cp btsync "${D}/usr/bin/btsync"
	pax-mark m "${D}/usr/bin/btsync"
}