# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="The plugin for placing evolution in notification area"
HOMEPAGE="http://gnome.eu.org/evo/index.php/Evolution_Tray"
SRC_URI="http://gnome.eu.org/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="mail-client/evolution"
RDEPEND="${DEPEND}"
