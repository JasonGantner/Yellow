# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig zig

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz
	verify-sig? ( https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz.sig )
	https://codeberg.org/ifreund/zig-wayland/archive/v0.2.0.tar.gz -> zig-wayland-0.2.0.tar.gz
	https://codeberg.org/ifreund/zig-xkbcommon/archive/v0.2.0.tar.gz -> zig-xkbcommon-0.2.0.tar.gz
	"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	sys-libs/pam
	x11-libs/libxkbcommon
	"
RDEPEND="${DEPEND}"
BDEPEND="
	app-text/scdoc
	virtual/pkgconfig
	verify-sig? ( sec-keys/openpgp-keys-ifreund )
	"
VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/ifreund.asc

src_unpack() {
	default_src_unpack
	verify-sig_verify_detached "${DISTDIR}/${P}.tar.gz" "${DISTDIR}/${P}.tar.gz.sig"
	mv zig-wayland 1220687c8c47a48ba285d26a05600f8700d37fc637e223ced3aa8324f3650bf52242 || die
	mv zig-xkbcommon 1220c90b2228d65fd8427a837d31b0add83e9fade1dcfa539bb56fd06f1f8461605f || die
}
