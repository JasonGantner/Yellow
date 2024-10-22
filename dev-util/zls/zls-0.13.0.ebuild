# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit zig

DESCRIPTION="Zig language server"
HOMEPAGE="https://github.com/zigtools/zls"
SRC_URI="
	https://github.com/zigtools/zls/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ziglibs/known-folders/archive/0ad514dcfb7525e32ae349b9acc0a53976f3a9fa.tar.gz
		-> known-folders-0ad514dcfb7525e32ae349b9acc0a53976f3a9fa.gh.tar.gz
	https://github.com/ziglibs/diffz/archive/ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.tar.gz
		-> diffz-ef45c00d655e5e40faf35afbbde81a1fa5ed7ffb.gh.tar.gz
	https://raw.githubusercontent.com/ziglang/zig/${PV}/doc/langref.html.in -> zig-langref-${PV}.html.in
	"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64"

IUSE="pie +threads doc"

BDEPEND="
	|| (
		dev-lang/zig:${SLOT}
		dev-lang/zig-bin:${SLOT}
	)
"

src_configure() {
	EZIG_FLAGS=(
		-Dpie=$(usex pie true false)
		-Dsingle-threaded=$(usex threads false true)
		-Duse_llvm=true
		-Ddata_version=${PV}
		-Dversion_data_path="${DISTDIR}/zig-langref-${PV}.html.in"
		-Denable_tracy=$(usex debug true false)
		-Denable_tracy_allocation=$(usex debug true false)
		-Denable_tracy_callstack=$(usex debug true false)
		-Duse_gpa=$(usex debug true false)
	)
}

src_install() {
	zig_src_install
	use doc && dodoc README.md
}
