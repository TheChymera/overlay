# Copyright 1999-2017 Gentoo Foundation                                                                                                 
# Distributed under the terms of the GNU General Public License v2                                                                      
# $Id$                                                                                                                                  

EAPI=6

DESCRIPTION="My dummy  ebuild"
HOMEPAGE="https://www.gentoo.org"
SRC_URI=""

LICENSE="HPND"
SLOT="0/1"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() (
    mkdir "${S}"
)

