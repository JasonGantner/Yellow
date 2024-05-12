# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Wayland Overlay Bar"
HOMEPAGE="https://github.com/francma/wob"
SRC_URI="https://github.com/francma/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64"
IUSE="man seccomp"

DEPEND="dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/meson
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	man? ( >=app-text/scdoc-1.9.2 )
	seccomp? ( sys-libs/libseccomp )"

src_configure (){
	local emesonargs=(
		$(meson_feature seccomp)
		$(meson_feature man man-pages)
	)
	meson_src_configure
}
