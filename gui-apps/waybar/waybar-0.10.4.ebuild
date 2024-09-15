# SPDX-License-Identifier: GPL-2.0
# Copyright 1999-2024 Gentoo Authors
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Highly customizable Wayland bar for Sway and Wlroots based compositors"
HOMEPAGE="https://github.com/Alexays/Waybar"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/Alexays/${PN^}.git"
else
	SRC_URI="https://github.com/Alexays/${PN^}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN^}-${PV}"
fi

LICENSE="MIT"
SLOT="0"
IUSE="cava evdev experimental jack libcxx +libinput +logind +man mpd playerctl network pipewire pulseaudio rfkill sndio systemd test tray +udev upower wireplumber"
REQUIRED_USE="
	playerctl? ( logind )
	upower? ( logind )
"

RESTRICT="!test? ( test )"

BDEPEND="
	man? ( >=app-text/scdoc-1.9.2 )
	dev-build/meson
	dev-util/gdbus-codegen
	virtual/pkgconfig
"
RDEPEND="
	dev-cpp/cairomm:0
	dev-cpp/glibmm:2
	x11-libs/gtk+:3[wayland]
	rfkill? ( sys-apps/util-linux )
"
DEPEND="${RDEPEND}
	dev-cpp/gtkmm:3.0
	dev-libs/date:=
	dev-libs/glib:2
	dev-libs/jsoncpp:=
	>=dev-libs/libfmt-8.1.1:=
	dev-libs/libinput:=
	dev-libs/libsigc++:2
	>=dev-libs/spdlog-1.10.0:=
	dev-libs/wayland
	dev-libs/wayland-protocols
	>=gui-libs/gtk-layer-shell-0.6.0
	gui-libs/wlroots:=
	x11-libs/libxkbcommon
	test? ( dev-cpp/catch:0 )
	cava? ( >=media-libs/libcava-0.10.2[jack?,pipewire?,pulseaudio?,sndio?] )
	evdev? ( dev-libs/libevdev:= )
	jack? ( virtual/jack )
	libcxx? ( sys-libs/libcxx )
	libinput? ( dev-libs/libinput:= )
	logind? ( || ( sys-apps/systemd sys-auth/elogind ) )
	mpd? ( media-libs/libmpdclient )
	network? ( dev-libs/libnl:3 )
	pipewire? ( media-video/pipewire )
	playerctl? ( >=media-sound/playerctl-2 )
	pulseaudio? ( media-libs/libpulse )
	sndio? ( media-sound/sndio:= )
	systemd? ( sys-apps/systemd:= )
	tray? ( dev-libs/libdbusmenu[gtk3] dev-libs/libayatana-appindicator )
	udev? ( virtual/libudev:= )
	upower? ( sys-power/upower )
	wireplumber? ( media-video/wireplumber:0/0.5 )
"

src_configure() {
	local emesonargs=(
		$(meson_feature man man-pages)
		$(meson_feature cava)
		$(meson_feature evdev libevdev)
		$(meson_feature jack)
		$(meson_feature libinput)
		$(meson_feature logind)
		$(meson_feature mpd)
		$(meson_feature playerctl mpris)
		$(meson_feature network libnl)
		$(meson_feature pulseaudio)
		$(meson_feature pipewire)
		$(meson_feature sndio)
		$(meson_feature systemd)
		$(meson_feature test tests)
		$(meson_feature tray dbusmenu-gtk)
		$(meson_feature udev libudev)
		$(meson_feature upower upower_glib)
		$(meson_feature rfkill)
		$(meson_feature wireplumber)
		$(meson_use libcxx)
		$(meson_use experimental)
	)
	meson_src_configure
}
