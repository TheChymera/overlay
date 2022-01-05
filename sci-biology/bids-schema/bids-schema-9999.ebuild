# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

MY_PN="bids-specification"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Official YAML schema for BIDS specification"
HOMEPAGE="https://github.com/bids-standard/bids-specification"
#SRC_URI="https://github.com/bids-standard/bids-specification/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz"
EGIT_REPO_URI="https://github.com/bids-standard/bids-specification"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND=""
DEPEND=""

src_install() {
	insinto "/usr/share/${PN}"
	doins -r src/schema/*
}
