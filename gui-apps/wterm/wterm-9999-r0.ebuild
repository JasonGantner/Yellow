# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="xterm (st fork) for wayland"
HOMEPAGE="https://github.com/majestrate/wterm"
EGIT_REPO_URI="https://github.com/majestrate/wterm.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug +drm +video_cards_intel video_cards_nouveau +wayland"
REQUIRED_USE="wayland drm video_cards_intel"

DEPEND="media-libs/fontconfig x11-libs/libxkbcommon x11-libs/pixman
drm? ( x11-libs/libdrm[video_cards_intel?,video_cards_nouveau?] )
wayland? ( dev-libs/wayland )"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig dev-libs/wayland-protocols"

PATCHES="${FILESDIR}"

src_compile(){
	use debug && export ENABLE_DEBUG=1
	use drm && {
	    export ENABLE_DRM=1
		use video_cards_intel && export ENABLE_INTEL=1
		use video_cards_nouveau && export ENABLE_NOUVEAU=1
	}
	use wayland && export ENABLE_WAYLAND=1
	append-flags '-I/usr/include/X11/pixman-1' && export 'ENABLE_PIXMAN=1'
	emake
}
