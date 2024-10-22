# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit verify-sig zig

DESCRIPTION="NCurses Disk Usage"
HOMEPAGE="https://dev.yorhel.nl/ncdu"
SRC_URI="
	https://dev.yorhel.nl/download/${P}.tar.gz
	https://dev.yorhel.nl/download/${P}.tar.gz.asc -> ${P}.tar.gz.sig
	"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="pie"

DEPEND="
	app-arch/zstd
	sys-libs/ncurses[unicode(+)]
	"
RDEPEND="${DEPEND}"
BDEPEND="
	verify-sig? ( sec-keys/openpgp-keys-yorhel )
	"

VERIFY_SIG_OPENPGP_KEY_PATH='/usr/share/openpgp-keys/yoranheling.asc'

src_configure() {
	EZIG_FLAGS=(
		-Dpie=$(usex pie true false)
	)
}

src_install() {
	zig_src_install
	doman "${S}/ncdu.1"
}
