# SPDX-License-Identifier: GPL-2.0 OR ISC
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="An unofficial, unendorsed language server for meson written in C++"
HOMEPAGE="https://github.com/JCWasmx86/mesonlsp"
TSM_V="1.0.7"
ADA_V="2.7.4"
SHA2_C="49265c656f9b370da660531db8cc6bf0a2e110a6"

SRC_URI="
	https://github.com/amosnier/sha-2/archive/${SHA2_C}.tar.gz -> sha-2-${SHA2_C}.tar.gz
	https://github.com/JCWasmx86/muon/archive/refs/heads/master.tar.gz -> muon-master.tar.gz
	https://github.com/JCWasmx86/tree-sitter-ini/archive/refs/heads/master.tar.gz -> tree-sitter-ini-master.tar.gz
	https://github.com/JCWasmx86/tree-sitter-meson/archive/refs/tags/v${TSM_V}.tar.gz -> tree-sitter-meson-${TSM_V}.tar.gz
	https://github.com/ada-url/ada/archive/refs/tags/v${ADA_V}.tar.gz -> ada-${ADA_V}.tar.gz
	https://github.com/JCWasmx86/mesonlsp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="jemalloc mimalloc static test"
REQUIRED_USE="?? ( jemalloc mimalloc )"
RESTRICT="!test? ( test )"
DEPEND="
	jemalloc? ( dev-libs/jemalloc )
	mimalloc? ( dev-libs/mimalloc )
	test? ( dev-cpp/gtest )
	app-arch/libarchive
	dev-cpp/nlohmann_json
	dev-cpp/tomlplusplus
	dev-util/pkgconf
	dev-libs/tree-sitter
	net-misc/curl
	sys-apps/util-linux
	static? (
		app-arch/brotli
		app-arch/lzma
		sys-libs/zlib
	)
	"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	dev-build/meson
	dev-build/ninja
	"

PATCHES="${FILESDIR}"

src_unpack(){
	default_src_unpack
	mkdir -p "${S}/subprojects/packagecache"
	for dir in muon tree-sitter-ini; do
		ln -s "$(pwd)/${dir}-master" "${S}/subprojects/packagecache/${dir}"
	done
	ln -s "$(pwd)/sha-2-${SHA2_C}" "${S}/subprojects/packagecache/sha256"
	ln -s "$(pwd)/ada-${ADA_V}" "${S}/subprojects/packagecache/ada"
	ln -s "$(pwd)/tree-sitter-meson-${TSM_V}" "${S}/subprojects/packagecache/tree-sitter-meson"
}

src_configure(){
	local emesonargs=(
		-Duse_own_tree_sitter=false
		#$(meson_use system_tree-sitter use_own_tree_sitter)
		$(meson_use jemalloc use_jemalloc)
		$(meson_use mimalloc use_mimalloc)
		-Duse_mimalloc_wrap=false
		$(meson_use test tests)
		$(meson_use static static_build)
	)
	meson_src_configure
}
