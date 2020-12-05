# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A collection of rat brain atlases in NIfTI format"
HOMEPAGE="https://github.com/IBT-FMI/rat-brain-atlases"
SRC_URI="http://chymera.eu/distfiles/${P}.tar.xz"

LICENSE="fairuse"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

pkg_pretend() {
	CHECKREQS_DISK_BUILD="42G"
	check-reqs_pkg_pretend
}

# We disable this phase to not check requirements twice.
pkg_setup() { :; }

src_install() {
	insinto "/usr/share/${PN}"
	doins *
}
