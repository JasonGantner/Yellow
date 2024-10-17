# SPDX-License-Identifier: GPL-2.0 or ISC
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Shell script to compute zig dependency hashes"
HOMEPAGE="https://zig.news/michalsieron/buildzigzon-dependency-hashes-47kj"
SRC_URI="https://gist.github.com/michalsieron/a07da4216d6c5e69b32f2993c61af1b7/raw/7cf8d466d1c20614880d7c565965f3de62ec39d6/zig-hash.sh"

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
	newbin "${DISTDIR}/zig-hash.sh" zig-hash
}
