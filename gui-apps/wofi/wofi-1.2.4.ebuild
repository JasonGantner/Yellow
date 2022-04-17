# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A lancher/menu program for wlroots based compositors"
HOMEPAGE="https://hg.sr.ht/~scoopta/wofi"
SRC_URI="https://hg.sr.ht/~scoopta/${PN}/archive/v${PV}.tar.gz -> ${P}.tag.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE="+run +drun +dmenu"
REQUIRED_USE="|| ( run drun dmenu )"

DEPEND="x11-libs/gtk+ dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson virtual/pkgconfig"

S="${WORKDIR}/${PN}-v${PV}"

src_configure(){
	meson_src_configure $(meson_use run enable_run) $(meson_use drun enable_drun) $(meson_use dmenu enable_dmenu)
}
