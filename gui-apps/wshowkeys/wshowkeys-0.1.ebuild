# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Displays keypresses on screen on supported compositors"
# HOMEPAGE="https://git.sr.ht/~sircmpwn/wshowkeys"
HOMEPAGE="https://github.com/ammgws/wshowkeys"

SRC_URI="https://github.com/ammgws/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/libinput
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	virtual/udev"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/meson"

pkg_preinst(){
	chmod u+s "${D}/usr/bin/wshowkeys"
}
