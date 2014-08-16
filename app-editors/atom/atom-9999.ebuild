# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 git-2

DESCRIPTION="A modern, approachable, and hackable text editor."
HOMEPAGE="https://atom.io/"
EGIT_REPO_URI="https://github.com/atom/atom.git"
SRC_URI=""


SLOT="0"
LICENSE="MIT"
KEYWORDS="~x86 ~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	gnome-base/libgnome-keyring
	${PYTHON_DEPS}	
"

RDEPEND="
	${DEPEND}
	>=net-libs/nodejs-0.10.29[npm]
"

src_compile() {
	script/build --verbose --no-quiet || die
}

src_install() {
	dobin atom-shell/atom
}


