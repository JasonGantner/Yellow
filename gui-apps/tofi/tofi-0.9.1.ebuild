# SPDX-License-Identifier: GPL-2.0 OR ISC
# Copyright 2020-2024 Jason André Charles Gantner
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="A lancher/menu program for wlroots based compositors"
HOMEPAGE="https://github.com/philj56/tofi"
SRC_URI="https://github.com/philj56/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+man"

DEPEND="
	dev-libs/glib:2
	dev-libs/gtk:2
	dev-libs/wayland:=
	media-libs/freetype
	media-libs/harfbuzz
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/meson
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
"

src_configure(){
	meson_src_configure $(meson_feature man man-pages)
}
