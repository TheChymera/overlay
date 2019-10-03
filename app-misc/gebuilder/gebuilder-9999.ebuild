# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Gentoo System and Image Builder"
HOMEPAGE="https://github.com/IBT-FMI/gebuilder"
SRC_URI=""
EGIT_REPO_URI="https://github.com/IBT-FMI/gebuilder.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="autoupdate btrfs docker"

DEPEND="
	>=app-shells/bash-4.2:*
	dev-python/python-glanceclient
	net-misc/rsync
	sys-apps/portage
	sys-apps/util-linux
	sys-boot/syslinux
	sys-fs/duperemove
	sys-kernel/dracut
"
RDEPEND="${DEPEND}
	sys-process/lsof
	docker? ( >=app-emulation/docker-18.05.0 )
	btrfs? ( sys-fs/btrfs-progs )
	autoupdate? ( virtual/cron )
"

src_install() {
	cd gebuilder || die
	insinto /usr/share/gebuilder
	doins -r utils config
	exeinto /usr/bin
	doexe gebuild
	insopts "-m0755"
	doins -r example_hooks exec.sh scripts

	if use autoupdate; then
		einfo "Installing weekly cron job:"
		insinto /etc/cron.weekly
		doins "${FILESDIR}/gebuilder_global_update"
	fi
}
