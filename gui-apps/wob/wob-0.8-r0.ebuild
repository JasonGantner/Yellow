# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Wayland Overlay Bar"
HOMEPAGE="https://github.com/francma/wob"
SRC_URI="https://github.com/francma/${PN}/releases/download/${V}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-libs/wayland dev-libs/wayland-protocols"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson app-text/scdoc"
