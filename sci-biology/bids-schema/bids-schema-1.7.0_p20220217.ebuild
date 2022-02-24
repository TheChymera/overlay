# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="YAML schema reference for BIDS specification"
HOMEPAGE="https://github.com/bids-standard/bids-schema"
EGIT_REPO_URI="https://github.com/bids-standard/bids-schema.git"
EGIT_COMMIT="1072684f5a86915f0ee03732dc558db188972c67"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"

RDEPEND=""
DEPEND=""

src_install() {
	insinto "/usr/share/${PN}"
	doins -r versions/*
}
