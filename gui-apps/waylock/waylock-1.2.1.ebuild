# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig zig

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz
	verify-sig? ( https://codeberg.org/ifreund/waylock/releases/download/v${PV}/${P}.tar.gz.sig )
	"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	sys-libs/pam
	x11-libs/xkbcommon
	"
RDEPEND="${DEPEND}"
BDEPEND="
	app-text/scdoc
	virtual/pkgconfig
	verify-sig? ( sec-keys/openpgp-keys-ifreund )
	"

