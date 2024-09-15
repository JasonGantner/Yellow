# SPDX-License-Identifier: GPL-2.0 OR ISC
# Copyright 2020-2024 Jason André Charles Gantner
# Distributed under the terms of the ISC License

EAPI=8

inherit git-r3 meson

DESCRIPTION="Displays keypresses on screen on supported compositors"
HOMEPAGE="https://github.com/JasonGantner/wshowkeys"
EGIT_REPO_URI="${HOMEPAGE}.git"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-libs/libinput
	dev-libs/wayland:=
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	virtual/udev"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-vcs/git
	dev-build/meson
	"

pkg_preinst(){
	chmod u+s "${D}/usr/bin/wshowkeys"
}
