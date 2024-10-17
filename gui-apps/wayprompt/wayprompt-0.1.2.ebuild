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
	https://codeberg.org/ifreund/zig-pixman/archive/v0.2.0.tar.gz -> zig-pixman-v0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz -> zig-wayland-v0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz -> zig-xkbcommon-v0.2.0.tar.gz
	https://git.sr.ht/~novakane/zig-fcft/archive/1.1.0.tar.gz -> zig-fcft-1.1.0.tar.gz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	media-libs/fcft
	x11-libs/libxkbcommon
	x11-libs/pixman
	"
RDEPEND="${DEPEND}"
BDEPEND="
	|| (
		>=dev-lang/zig-0.11.0
		>=dev-lang/zig-bin-0.11.0
	)
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	virtual/pkgconfig
	"

src_unpack() {
	default_src_unpack
	mv "${PN}-v${PV}" "${P}" || die
	mv zig-ini-879c74a3a801d49fa34343aebd55a22f591899b3 12201bbf05e1fb73323a9b13d2599dc4bf82851e6d328d7523a1af5b861a87edf286 || die
	mv zig-spoon-fdba8e643c9558254bf4e6c600dfbd782fa7a267 12202727aaaf0e742d4945be55af1ace8b25902095e0c1b0a24b70cc80a81b7ac518 || die
	mv zig-pixman 12209db20ce873af176138b76632931def33a10539387cba745db72933c43d274d56 || die
	mv zig-wayland 1220687c8c47a48ba285d26a05600f8700d37fc637e223ced3aa8324f3650bf52242 || die
	mv zig-xkbcommon 1220c90b2228d65fd8427a837d31b0add83e9fade1dcfa539bb56fd06f1f8461605f || die
	mv zig-fcft-1.1.0 1220a4029ee3ee70d3175c69878e2b70dccd000c4324bc74ba800d8a143b7250fb38 || die
}

src_compile() {
	zig_src_compile -Dstrip=false -Dpie=true
}

# TODO add /etc/wayprompt/config.ini
