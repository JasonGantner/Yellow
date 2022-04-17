# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A program to control backlight (and other hardware lights)"
HOMEPAGE="https://github.com/haikarainen/light"
SRC_URI="https://github.com/haikarainen/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="udev"

DEPEND="udev? ( virtual/udev )"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	./autogen.sh
	econf $(use_with udev)
}
