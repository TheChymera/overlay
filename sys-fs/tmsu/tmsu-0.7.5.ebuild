# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

MY_PN="TMSU"
HOMEPAGE="https://github.com/oniony/TMSU"
DESCRIPTION="File tagger and virtual tag-based filesystem"

EGO_SUM=(
	"github.com/hanwen/go-fuse v1.0.0"
	"github.com/hanwen/go-fuse v1.0.0/go.mod"
	"github.com/mattn/go-sqlite3 v1.14.7"
	"github.com/mattn/go-sqlite3 v1.14.7/go.mod"
	"golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a"
	"golang.org/x/crypto v0.0.0-20210513164829-c07d793c2f9a/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/oniony/TMSU/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}/tmsu-0.7.5-new_go.patch"
)

S="${WORKDIR}/${MY_PN}-${PV}"
