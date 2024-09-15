# SPDX-License-Identifier: GPL-2.0 OR ISC
# Copyright 2020-2024 Jason André Charles Gantner
# Distributed under the terms of the ISC License

EAPI=8

inherit git-r3

DESCRIPTION="xterm (st fork) for wayland"
HOMEPAGE="https://github.com/majestrate/wterm"
EGIT_REPO_URI="https://github.com/majestrate/wterm.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug drm +pixman video_cards_intel video_cards_nouveau +wayland"
REQUIRED_USE="
	|| ( wayland drm )
	drm? ( || ( video_cards_intel video_cards_nouveau ) )"

DEPEND="
	media-libs/fontconfig
	x11-libs/libxkbcommon
	pixman? ( x11-libs/pixman )
	drm? ( x11-libs/libdrm[video_cards_intel?,video_cards_nouveau?] )
	wayland? ( dev-libs/wayland )"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-libs/wayland-protocols"

PATCHES="${FILESDIR}"

src_configure(){
	use debug && export ENABLE_DEBUG=1
	use drm && {
		export ENABLE_DRM=1
		export ENABLE_INTEL=$(use video_cards_intel && echo 1 || echo 0)
		export ENABLE_NOUVEAU=$(use video_cards_nouveau && echo 1 || echo 0)
	}|| export ENABLE_DRM=0
	export ENABLE_WAYLAND=$(use wayland && echo 1 || echo 0)
	export ENABLE_PIXMAN=$(use pixman && echo 1 || echo 0)
}

src_compile(){
	emake
}
