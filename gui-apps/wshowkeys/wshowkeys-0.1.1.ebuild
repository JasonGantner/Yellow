# SPDX-License-Identifier: GPL-2.0 OR ISC
# Copyright 2020-2024 Jason André Charles Gantner
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="Displays keypresses on screen on supported compositors"
HOMEPAGE="https://github.com/JasonGantner/wshowkeys"

SRC_URI="https://github.com/JasonGantner/wshowkeys/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/libinput
	dev-libs/wayland:=
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	virtual/udev"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/meson
	"

pkg_preinst(){
	chmod u+s "${D}/usr/bin/wshowkeys"
}
