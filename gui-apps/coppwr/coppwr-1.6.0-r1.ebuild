# SPDX-License-Identifier: GPL-2.0
# Copyright 2024 Gentoo Authors
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	ab_glyph@0.2.25
	ab_glyph_rasterizer@0.1.8
	accesskit@0.12.3
	accesskit_consumer@0.16.1
	accesskit_macos@0.10.1
	accesskit_unix@0.6.2
	accesskit_windows@0.15.1
	accesskit_winit@0.16.1
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-activity@0.5.2
	android-properties@0.2.2
	android_system_properties@0.1.5
	annotate-snippets@0.9.2
	anyhow@1.0.82
	arboard@3.4.0
	arrayref@0.3.7
	arrayvec@0.7.4
	as-raw-xcb-connection@1.0.1
	ash@0.37.3+1.3.251
	ashpd@0.7.0
	async-broadcast@0.5.1
	async-channel@2.2.1
	async-executor@1.11.0
	async-fs@1.6.0
	async-fs@2.1.2
	async-io@1.13.0
	async-io@2.3.2
	async-lock@2.8.0
	async-lock@3.3.0
	async-net@2.0.0
	async-once-cell@0.5.3
	async-process@1.8.1
	async-recursion@1.1.1
	async-signal@0.2.6
	async-task@4.7.1
	async-trait@0.1.80
	atomic-waker@1.1.2
	atspi@0.19.0
	atspi-common@0.3.0
	atspi-connection@0.3.0
	atspi-proxies@0.3.0
	autocfg@1.2.0
	base64@0.21.7
	bindgen@0.69.4
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.5.0
	block@0.1.6
	block-buffer@0.10.4
	block-sys@0.1.0-beta.1
	block-sys@0.2.1
	block2@0.2.0-alpha.6
	block2@0.3.0
	block2@0.5.0
	blocking@1.6.0
	bumpalo@3.16.0
	bytemuck@1.15.0
	bytemuck_derive@1.6.0
	byteorder@1.5.0
	bytes@1.6.0
	calloop@0.12.4
	calloop-wayland-source@0.2.0
	cc@1.0.96
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-expr@0.15.8
	cfg-if@1.0.0
	cfg_aliases@0.1.1
	cgl@0.3.2
	clang-sys@1.7.0
	clipboard-win@5.3.1
	cocoa@0.25.0
	cocoa-foundation@0.1.2
	codespan-reporting@0.11.1
	color_quant@1.1.0
	com@0.6.0
	com_macros@0.6.0
	com_macros_support@0.6.0
	combine@4.6.7
	concurrent-queue@2.5.0
	convert_case@0.6.0
	cookie-factory@0.3.3
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	core-graphics@0.23.2
	core-graphics-types@0.1.3
	cpufeatures@0.2.12
	crc32fast@1.4.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crypto-common@0.1.6
	cursor-icon@1.1.0
	derivative@2.2.0
	digest@0.10.7
	directories-next@2.0.0
	dirs-sys-next@0.1.2
	dispatch@0.2.0
	dlib@0.5.2
	document-features@0.2.8
	downcast-rs@1.2.1
	duplicate@1.0.0
	ecolor@0.27.2
	eframe@0.27.2
	egui@0.27.2
	egui-wgpu@0.27.2
	egui-winit@0.27.2
	egui_dock@0.12.0
	egui_glow@0.27.2
	egui_plot@0.27.2
	either@1.11.0
	emath@0.27.2
	enumflags2@0.7.9
	enumflags2_derive@0.7.9
	enumn@0.1.13
	epaint@0.27.2
	equivalent@1.0.1
	errno@0.3.8
	error-code@3.2.0
	event-listener@2.5.3
	event-listener@3.1.0
	event-listener@4.0.3
	event-listener@5.3.0
	event-listener-strategy@0.4.0
	event-listener-strategy@0.5.2
	fastrand@1.9.0
	fastrand@2.1.0
	fdeflate@0.3.4
	flate2@1.0.30
	foreign-types@0.5.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	form_urlencoded@1.2.1
	futures@0.3.30
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-lite@1.13.0
	futures-lite@2.3.0
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.14
	gl_generator@0.14.0
	glob@0.3.1
	glow@0.13.1
	glutin@0.31.3
	glutin-winit@0.4.2
	glutin_egl_sys@0.6.0
	glutin_glx_sys@0.5.0
	glutin_wgl_sys@0.5.0
	gpu-alloc@0.6.0
	gpu-alloc-types@0.3.0
	gpu-allocator@0.25.0
	gpu-descriptor@0.2.4
	gpu-descriptor-types@0.1.2
	hashbrown@0.14.5
	hassle-rs@0.11.0
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	hex@0.4.3
	hexf-parse@0.2.1
	home@0.5.9
	icrate@0.0.4
	idna@0.5.0
	image@0.24.9
	indexmap@2.2.6
	instant@0.1.12
	io-lifetimes@1.0.11
	itertools@0.12.1
	jni@0.21.1
	jni-sys@0.3.0
	jobserver@0.1.31
	js-sys@0.3.69
	khronos-egl@6.0.0
	khronos_api@3.1.0
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.154
	libloading@0.7.4
	libloading@0.8.3
	libredox@0.0.2
	libredox@0.1.3
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.13
	litrs@0.4.1
	lock_api@0.4.12
	log@0.4.21
	malloc_buf@0.0.6
	memchr@2.7.2
	memmap2@0.9.4
	memoffset@0.7.1
	memoffset@0.9.1
	metal@0.27.0
	minimal-lexical@0.2.1
	miniz_oxide@0.7.2
	naga@0.19.2
	ndk@0.8.0
	ndk-context@0.1.1
	ndk-sys@0.5.0+25.2.9519653
	nix@0.26.4
	nix@0.27.1
	nohash-hasher@0.2.0
	nom@7.1.3
	num-traits@0.2.18
	num_enum@0.7.2
	num_enum_derive@0.7.2
	objc@0.2.7
	objc-sys@0.2.0-beta.2
	objc-sys@0.3.3
	objc2@0.3.0-beta.3.patch-leaks.3
	objc2@0.4.1
	objc2@0.5.1
	objc2-app-kit@0.2.0
	objc2-core-data@0.2.0
	objc2-encode@2.0.0-pre.2
	objc2-encode@3.0.0
	objc2-encode@4.0.1
	objc2-foundation@0.2.0
	objc_exception@0.1.2
	once_cell@1.19.0
	orbclient@0.3.47
	ordered-stream@0.2.0
	owned_ttf_parser@0.20.0
	parking@2.2.0
	parking_lot@0.12.2
	parking_lot_core@0.9.10
	paste@1.0.14
	percent-encoding@2.3.1
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.30
	png@0.17.13
	polling@2.8.0
	polling@3.7.0
	pollster@0.3.0
	ppv-lite86@0.2.17
	presser@0.3.1
	proc-macro-crate@1.3.1
	proc-macro-crate@3.1.0
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.81
	profiling@1.0.15
	quick-xml@0.31.0
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	raw-window-handle@0.5.2
	raw-window-handle@0.6.1
	rayon@1.10.0
	rayon-core@1.12.1
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	redox_syscall@0.5.1
	redox_users@0.4.5
	regex@1.10.4
	regex-automata@0.4.6
	regex-syntax@0.8.3
	renderdoc-sys@1.1.0
	ron@0.8.1
	rustc-hash@1.1.0
	rustix@0.37.27
	rustix@0.38.34
	same-file@1.0.6
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sctk-adwaita@0.8.1
	serde@1.0.200
	serde_derive@1.0.200
	serde_repr@0.1.19
	serde_spanned@0.6.5
	sha1@0.10.6
	shlex@1.3.0
	signal-hook-registry@1.4.2
	simd-adler32@0.3.7
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.13.2
	smithay-client-toolkit@0.18.1
	smithay-clipboard@0.7.1
	smol_str@0.2.1
	socket2@0.4.10
	spirv@0.3.0+sdk-1.3.268.0
	static_assertions@1.1.0
	strict-num@0.1.1
	syn@1.0.109
	syn@2.0.60
	system-deps@6.2.2
	target-lexicon@0.12.14
	tempfile@3.10.1
	termcolor@1.4.1
	thiserror@1.0.59
	thiserror-impl@1.0.59
	tiny-skia@0.11.4
	tiny-skia-path@0.11.4
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.8.12
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.1
	toml_edit@0.22.12
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	ttf-parser@0.20.0
	type-map@0.5.0
	typenum@1.17.0
	uds_windows@1.1.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.12
	unicode-xid@0.2.4
	url@2.5.0
	version-compare@0.2.0
	version_check@0.9.4
	waker-fn@1.1.1
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.92
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-shared@0.2.92
	wayland-backend@0.3.3
	wayland-client@0.31.2
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.1
	wayland-protocols@0.31.2
	wayland-protocols-plasma@0.2.0
	wayland-protocols-wlr@0.2.0
	wayland-scanner@0.31.1
	wayland-sys@0.31.1
	web-sys@0.3.69
	web-time@0.2.4
	webbrowser@0.8.15
	wgpu@0.19.4
	wgpu-core@0.19.4
	wgpu-hal@0.19.4
	wgpu-types@0.19.2
	widestring@1.1.0
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.48.0
	windows@0.52.0
	windows-core@0.52.0
	windows-implement@0.48.0
	windows-interface@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winit@0.29.15
	winnow@0.5.40
	winnow@0.6.7
	x11-dl@2.21.0
	x11rb@0.13.1
	x11rb-protocol@0.13.1
	xcursor@0.3.5
	xdg-home@1.1.0
	xkbcommon-dl@0.4.2
	xkeysym@0.2.0
	xml-rs@0.8.20
	yansi-term@0.1.2
	zbus@3.15.2
	zbus_macros@3.15.2
	zbus_names@2.6.1
	zerocopy@0.7.32
	zerocopy-derive@0.7.32
	zvariant@3.15.2
	zvariant_derive@3.15.2
	zvariant_utils@1.0.1
"

declare -A GIT_CRATES=(
	[egui_node_graph]="https://github.com/dimtpap/egui_node_graph;3e99a2af2025e72365a4ec5048011041a85002e5;egui_node_graph-%commit%/egui_node_graph"
	[pipewire]="https://gitlab.freedesktop.org/dimtpap/pipewire-rs;605d15996f3258b3e1cc34e445dfbdf16a366c7e;pipewire-rs-%commit%/pipewire"
	[pipewire-sys]="https://gitlab.freedesktop.org/dimtpap/pipewire-rs;605d15996f3258b3e1cc34e445dfbdf16a366c7e;pipewire-rs-%commit%/pipewire-sys"
	[libspa]="https://gitlab.freedesktop.org/dimtpap/pipewire-rs;605d15996f3258b3e1cc34e445dfbdf16a366c7e;pipewire-rs-%commit%/libspa"
	[libspa-sys]="https://gitlab.freedesktop.org/dimtpap/pipewire-rs;605d15996f3258b3e1cc34e445dfbdf16a366c7e;pipewire-rs-%commit%/libspa-sys"
)

inherit cargo desktop

DESCRIPTION="Low level control GUI for the PipeWire multimedia server"
HOMEPAGE="https://github.com/dimtpap/coppwr"
SRC_URI="
		${CARGO_CRATE_URIS}
		https://github.com/dimtpap/coppwr/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	media-video/pipewire
	"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/rust-1.72.0
	>=sys-devel/clang-5.0.0
	"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_install(){
	domenu assets/io.github.dimtpap.coppwr.desktop
	for size in 32 48 64 128 256 512;do
		newicon -s ${size} assets/icon/${size}.png io.github.dimtpap.coppwr.png
	done
	newicon -s scalable assets/icon/scalable.svg io.github.dimtpap.coppwr.svg
	cargo_src_install
}
