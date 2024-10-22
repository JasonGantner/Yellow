# SPDX-License-Identifier: GPL-2.0 or ISC
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Shell script to compute zig dependency hashes"
HOMEPAGE="https://zig.news/michalsieron/buildzigzon-dependency-hashes-47kj"
SRC_URI="https://github.com/michalsieron/zig-hash-sh/raw/fc8a4eab26779d701e7a2555e0becc8c8d920b26/zig-hash.sh -> ${P}.sh"

S="${DISTDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-alternatives/sh
	sys-apps/coreutils
	sys-apps/findutils
	sys-apps/sed
	"

src_install() {
	newbin "${DISTDIR}/${P}.sh" zig-hash
}
