# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Sway app that shows schemas for all workspaces to make navigation in sway easier"
HOMEPAGE="https://github.com/milgra/sov"
SRC_URI="https://github.com/milgra/sov/releases/download/${PV}/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/egl-wayland
	gui-libs/eglexternalplatform
	media-libs/freetype
	media-libs/glew
	media-libs/libglvnd
	media-libs/libpng
	x11-libs/libxkbcommon
	"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/meson
	dev-build/ninja
	dev-util/wayland-scanner
	virtual/pkgconfig
	"

pkg_postinst(){
	elog "upstream lists media-fonts/terminus-font as dependency"
}
