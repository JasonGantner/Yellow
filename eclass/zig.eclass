# SPDX-License-Identifier: GPL-2.0-or-later or CECILL-2.1
# Copyright 2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

# @ECLASS: zig.eclass
# @MAINTAINER:
# Jason André Charles Gantner <jason@gantner.pw>
# @AUTHOR:
# Jason André Charles Gantner <jason@gantner.pw>
# @SUPPORTED_EAPIS: 8
# @BLURB: common functions and variables for zig builds
# @DESCRIPTION:
# Automation of zig build.
# This is still considered unstable

case ${EAPI} in
	8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

if [[ ! ${_ZIG_ECLASS} ]]; then
_ZIG_ECLASS=1

# @ECLASS_VARIABLE: ZIG_DEPEND
# @OUTPUT_VARIABLE
# @DESCRIPTION:
# zig packages default dependencies automatically added unless ZIG_OPTIONAL is defined

ZIG_DEPEND="
	|| (
		dev-lang/zig
		dev-lang/zig-bin
	)
	>=dev-util/zig-hash-20241021
	"
[[ ! ${ZIG_OPTIONAL} ]] && BDEPEND="${ZIG_DEPEND}"

IUSE="${IUSE} debug test"
RESTRICT="${RESTRICT} !test? ( test )"

# @ECLASS_VARIABLE: ZIGFLAGS
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Flags to be passed to `zig build`

# @ECLASS_VARIABLE: ZIG_OPTIONAL
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# If set to a non-null value, you have to set the dev-lang/zig(-bin)? dependency
# and call the zig_* functions explicitely in your ebuild

# @ECLASS_VARIABLE: EZIG_FLAGS
# @DEFAULT_UNSET
# @DESCRIPTION:
# Flags to pass to each call of ezig

# @ECLASS_VARIABLE: EZIG_SYS_SRC
# @INTERNAL
# @DESCRIPTION:
# Path where zig searches source dependencies.
# Override only if you need to use the 'zig-cache' directory inside ${WORKDIR}
EZIG_SYS_SRC="${WORKDIR}/zig-cache"

# @FUNCTION: ezig
# @DESCRIPTION:
# Wrapper for zig build handling common use flags
# set -Dcpu=native to enable optimizations similar to -march=native
ezig() {
	debug-print-function ${FUNCNAME} "${@}"
	local optim cpu flag
	declare -a user_flags
	for flag in "${ZIGFLAGS[@]}"; do
		case "$flag" in
			-Doptimize=*)
				optim="$flag"
				;;
			-Dcpu=*)
				cpu="$flag"
				;;
			*)
				user_flags+=("$flag")
				;;
		esac
	done
	for flag in ${MAKEOPTS}; do
		case "$flag" in
			-j?*)
				user_flags+=("$flag")
				;;
			*) ;;
		esac
	done
	optim=$(usex debug -Doptimize=Debug "${optim:--Doptimize=ReleaseSafe}")
	cpu="${cpu:--Dcpu=baseline}" 
	set -- zig build --color on --prominent-compile-errors "${EZIG_FLAGS[@]}" "${user_flags[@]}" "$cpu" "$optim" \
		--system "${EZIG_SYS_SRC}/p" --search-prefix "${BROOT}/usr" --prefix "${EPREFIX}/usr" "${@}" 

	einfo "${@}"
	DESTDIR="${S}/zig-out" "${@}" || die 'zig build failed'
}

# @FUNCTION: zig_src_prepare
# @DESCRIPTION:
# Unpacks source dependencies
zig_src_prepare() {
	debug-print-function ${FUNCNAME} "${@}"

	default_src_prepare
	mkdir -p "${EZIG_SYS_SRC}/p"
	local srcdir hash
	find "${WORKDIR}" -mindepth 1 -maxdepth 1 -type d -print| while read -r srcdir; do
		if [ -f "${srcdir}/build.zig" ]; then
			hash=$(zig-hash "${srcdir}" || die)
			einfo "zig.eclass: linking $hash to ${srcdir}"
			ln -s "${srcdir}" "${EZIG_SYS_SRC}/p/$hash" || die
		fi
	done
}

# @FUNCTION: zig_src_compile
# @DESCRIPTION:
# Build the package with zig build
zig_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"
	
	ezig install
}

# @FUNCTION: zig_src_install
# @DESCRIPTION:
# Install the generated files given they're in standard locations
zig_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	cd zig-out/usr || die
	# regular files
	insinto "${EPREFIX}/usr"
	test -d share && doins -r share
	# headers
	test -d include && doheader -r include/*
	# libraries (both static and shared)
	if [ -d lib ]; then
		for lib in lib/*.so; do
			dolib.so "$lib"
		done
		for lib in lib/*.a; do
			dolib.a "$lib"
		done
		# TODO handle subdirectories?
	fi
	if [ -d libexec ];then
		exeinto "${EPREFIX}/usr/libexec"
		for file in libexec/*;do
			if [ -x "$file" ]; then
				doexe "$file"
			fi
			# TODO handle subdirectories?
		done
	fi
	test -d bin && dobin bin/*
	test -d sbin && dosbin sbin/*
}

# @FUNCTION: zig_src_test
# @DESCRIPTION:
# Run unit tests through `zig build test`
zig_src_test() {
	debug-print-function ${FUNCNAME} "${@}"
	
	ezig test --summary all || die
}

fi

if [[ ! ${ZIG_OPTIONAL} ]]; then
	EXPORT_FUNCTIONS src_prepare src_compile src_install src_test
fi
