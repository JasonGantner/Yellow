# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="Displays keypresses on screen on supported compositors"
# HOMEPAGE="https://git.sr.ht/~sircmpwn/wshowkeys"
HOMEPAGE="https://github.com/ammgws/wshowkeys"
EGIT_REPO_URI="${HOMEPAGE}.git"

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
BDEPEND="dev-vcs/git dev-build/meson"

pkg_preinst(){
	chmod u+s "${D}/usr/bin/wshowkeys"
}
