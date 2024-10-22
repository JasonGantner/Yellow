# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig

DESCRIPTION="A multi-purpose (password-)prompt tool for Wayland"
HOMEPAGE="https://git.sr.ht/~leon_plickat/wayprompt"
SRC_URI="
	https://git.sr.ht/~leon_plickat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://git.sr.ht/~leon_plickat/zig-ini/archive/879c74a3a801d49fa34343aebd55a22f591899b3.tar.gz -> zig-ini-879c74a3a801d49fa34343aebd55a22f591899b.tar.gz
	https://git.sr.ht/~leon_plickat/zig-spoon/archive/fdba8e643c9558254bf4e6c600dfbd782fa7a267.tar.gz -> zig-spoon-fdba8e643c9558254bf4e6c600dfbd782fa7a267.tar.gz
	https://codeberg.org/ifreund/zig-pixman/archive/v0.2.0.tar.gz -> zig-pixman-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz -> zig-wayland-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz -> zig-xkbcommon-0.2.0.tar.gz
	https://git.sr.ht/~novakane/zig-fcft/archive/1.1.0.tar.gz -> zig-fcft-1.1.0.tar.gz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="pie"
RESTRICT="test" # Remove once test fix has been accepted upstream

DEPEND="
	dev-libs/wayland
	media-libs/fcft
	x11-libs/libxkbcommon
	x11-libs/pixman
	"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
	"

src_unpack() {
	default_src_unpack
	mv "${PN}-v${PV}" "${P}" || die
}

src_configure() {
	EZIG_FLAGS=(
		-Dstrip=false
		-Dpie=$(usex pie true false)
	)
}

# TODO add /etc/wayprompt/config.ini
