# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson ninja-utils

DESCRIPTION="wdisplays is a wayland app for configuring displays in compositors."
HOMEPAGE="https://github.com/cyclopsian/wdisplays"
EGIT_REPO_URI="https://github.com/cyclopsian/wdisplays.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/gtk+ media-libs/libepoxy dev-libs/wayland"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/meson dev-libs/wayland-protocols"
