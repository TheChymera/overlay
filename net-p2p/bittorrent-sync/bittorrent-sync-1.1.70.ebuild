# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Automatically sync files via secure, distributed technology."
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="
	amd64? ( http://syncapp.bittorrent.com/${PV}/btsync_x64-${PV}.tar.gz )
	x86? ( http://syncapp.bittorrent.com/${PV}/btsync_i386-${PV}.tar.gz )"

LICENSE="bittorrent-sync"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

QA_PREBUILT="opt/bin/btsync"

src_install() {
	exeinto /opt/bin
	doexe btsync
	newconfd "${FILESDIR}/btsync.confd" btsync
	newinitd "${FILESDIR}/btsync.initd" btsync
}
