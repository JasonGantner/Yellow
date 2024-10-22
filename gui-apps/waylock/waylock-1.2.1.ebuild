# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig zig

DESCRIPTION="Small screenlocker for Wayland compositors"
HOMEPAGE="https://codeberg.org/ifreund/waylock"
SRC_URI="
	https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz
	verify-sig? ( https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz.sig )
	https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz -> zig-wayland-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz -> zig-xkbcommon-0.2.0.tar.gz
	"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

IUSE="+man pie"
RESTRICT="test"
DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	sys-libs/pam
	x11-libs/libxkbcommon
	"
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( app-text/scdoc )
	virtual/pkgconfig
	verify-sig? ( sec-keys/openpgp-keys-ifreund )
	"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/ifreund.asc

src_unpack() {
	verify-sig_verify_detached "${DISTDIR}/${P}.tar.gz" "${DISTDIR}/${P}.tar.gz.sig"
	default_src_unpack
}

src_configure(){
	EZIG_FLAGS=(
		-Dpie=$(usex pie true false)
		-Dstrip=false
		-Dman-pages=$(usex man true false)
	)
}
