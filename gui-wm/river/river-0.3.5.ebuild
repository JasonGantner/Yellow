# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig

DESCRIPTION="dynamic tiling Wayland compositor with flexible runtime configuration"
HOMEPAGE="https://isaacfreund.com/software/river/"
SRC_URI="
	https://codeberg.org/river/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://codeberg.org/ifreund/zig-pixman/archive/v0.2.0.tar.gz -> zig-pixman-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz -> zig-wayland-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-wlroots/archive/v0.18.0.tar.gz -> zig-wlroots-0.18.0.tar.gz
	https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz -> zig-xkbcommon-0.2.0.tar.gz
	"
S="${WORKDIR}/${PN}"

LICENSE="GPL-3+ ISC CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="man pie X"

DEPEND="
	dev-libs/libevdev
	dev-libs/wayland
	dev-libs/wayland-protocols
	gui-libs/wlroots
	x11-libs/pixman
	x11-libs/libxkbcommon
	"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	man? ( app-text/scdoc )
	"

src_configure() {
	EZIG_FLAGS=(
		-Dstrip=false
		-Dno-llvm=false
		-Dman-pages=$(usex man true false)
		-Dpie=$(usex pie true false)
		-Dxwayland=$(usex X true false)
	)
}
