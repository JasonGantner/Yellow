# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used by ifreund to sign releases"
HOMEPAGE="https://isaacfreund.com/"
SRC_URI="https://isaacfreund.com/public_key.txt -> ${P}.asc"
S="${WORKDIR}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="alpha amd64 arm arm64 ~hppa ~loong ~m68k ~mips ~ppc ppc64 ~riscv ~s390 ~sparc x86"

src_install() {
	insinto /usr/share/openpgp-keys
	newins "${DISTDIR}/${P}.asc" ifreund.asc
}
