# SPDX-License-Identifier: GPL-2.0
# Copyright 2022-2024 Gentoo Authors
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Console-based Audio Visualizer for Alsa"
HOMEPAGE="https://github.com/LukashonakV/cava/"
SRC_URI="
	https://github.com/LukashonakV/cava/archive/refs/tags/${PV}.tar.gz
		-> ${P}.tar.gz
"

S="${WORKDIR}/cava-${PV}"

LICENSE="MIT Unlicense"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="alsa jack ncurses pipewire portaudio pulseaudio sdl sndio"

RDEPEND="
	dev-libs/iniparser:4
	sci-libs/fftw:3.0=
	alsa? ( media-libs/alsa-lib )
	jack? ( virtual/jack )
	ncurses? ( sys-libs/ncurses:= )
	pipewire? ( media-video/pipewire:= )
	portaudio? ( media-libs/portaudio )
	pulseaudio? ( media-libs/libpulse )
	sdl? (
		media-libs/libglvnd
		media-libs/libsdl2[opengl,video]
	)
	sndio? ( media-sound/sndio:= )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/meson
	virtual/pkgconfig
	sdl? ( dev-build/autoconf-archive )
"

src_configure() {
	local emesonargs=(
		$(meson_feature alsa input_alsa)
		$(meson_feature jack input_jack)
		$(meson_feature pipewire input_pipewire)
		$(meson_feature portaudio input_portaudio)
		$(meson_feature pulseaudio input_pulse)
		$(meson_feature sndio input_sndio)

		$(meson_feature ncurses output_ncurses)
		$(meson_feature sdl output_sdl)
		# note: not behind USE=opengl and sdl2[opengl?] given have not gotten
		# normal output-sdl to work without USE=opengl on sdl either way
		$(meson_feature sdl output_sdl_glsl)
	)

	meson_src_configure
}
