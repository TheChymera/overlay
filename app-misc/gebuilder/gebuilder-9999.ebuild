# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Gentoo System and Image Builder"
HOMEPAGE="https://github.com/IBT-FMI/gebuilder"
EGIT_REPO_URI="https://github.com/IBT-FMI/gebuilder"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="autoupdate btrfs docker openstack test"
RESTRICT="!test? ( test )"

COMMON_DEPEND="
	>=app-shells/bash-4.2:*
	net-misc/rsync
	sys-apps/portage
	sys-apps/util-linux
	sys-boot/syslinux
	sys-fs/duperemove
	sys-kernel/dracut
"
DEPEND="${COMMON_DEPEND}
	sys-devel/m4
"
RDEPEND="${COMMON_DEPEND}
	sys-process/lsof
	autoupdate? ( virtual/cron )
	btrfs? ( sys-fs/btrfs-progs )
	docker? ( app-containers/docker )
	openstack? ( dev-python/python-glanceclient )
"

src_prepare(){
	if use !docker; then
		rm -rf gebuilder/scripts/*docker* || die
		rm gebuilder/tests/*docker* || die
	fi
	if use !openstack; then
		rm -rf gebuilder/scripts/*openstack* || die
		rm gebuilder/tests/*openstack* || die
	fi
	default
}

src_compile(){
	emake
}

src_install() {
	default
	if use autoupdate; then
		einfo "Installing weekly cron job:"
		insinto /etc/cron.weekly
		doins "${FILESDIR}/gebuilder_global_update"
	fi
}

src_test() {
	TMPDIR="${WORKDIR}/test_results"
	mkdir "${TMPDIR}"
	cd gebuilder
	./tests.sh || die
}
