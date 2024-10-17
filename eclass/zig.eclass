# SPDX-License-Identifier: GPL-2.0 or ISC
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
	"
[[ ! ${ZIG_OPTIONAL} ]] && BDEPEND="${ZIG_DEPEND}"

IUSE="${IUSE} debug"

# @ECLASS_VARIABLE: ZIGFLAGS
# @USER_VARIABLE
# @DEFAULT_UNSET
# @DESCRIPTION:
# Flags to be passed to zig build

# @ECLASS_VARIABLE: ZIG_OPTIONAL
# @DEFAULT_UNSET
# @PRE_INHERIT
# @DESCRIPTION:
# If set to a non-null value, you have to set the dev-lang/zig(-bin)? dependency
# and call the zig_* functions explicitely in your ebuild

# @FUNCTION: zig_src_compile
# @DESCRIPTION:
# Build the package with zig build
zig_src_compile() {
	debug-print-function ${FUNCNAME} "${@}"
	# TODO add flags deduplication and cleanup
	set -- zig build ${ZIGFLAGS} $(usex debug -Doptimize=Debug -Doptimize=ReleaseSafe) --color on --prominent-compile-errors --system "${WORKDIR}" --search-prefix "${BROOT}/usr" "${@}" install
	einfo "${@}"
	"${@}" || die 'zig build failed'
}

# @FUNCTION: zig_src_install
# @DESCRIPTION:
# Install the generated packages
zig_src_install() {
	debug-print-function ${FUNCNAME} "${@}"

	cd zig-out || die
	insinto "${EPREFIX}/usr"
	doins -r share
	insopts -m0755
	doins -r bin
}
# @FUNCTION: zig_src_test
# @DESCRIPTION:
# Run unit tests through `zig build test`
zig_src_test() {
	debug-print-function ${FUNCNAME} "${@}"

	set -- zig build ${ZIGFLAGS} $(usex debug -Doptimize=Debug -Doptimize=ReleaseSafe) --color on --prominent-compile-errors --system "${WORKDIR}" --search-prefix "${BROOT}/usr" "${@}" test
	einfo "${@}"
    "${@}" || die 'zig test failed'
}

fi

if [[ ! ${ZIG_OPTIONAL} ]]; then
	EXPORT_FUNCTIONS src_compile src_install src_test
fi
