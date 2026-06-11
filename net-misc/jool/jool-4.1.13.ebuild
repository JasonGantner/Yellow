# SPDX-License-Identifier: GPL-2.0
# Copyright 2022-2024 Jason André Charles Gantner
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An Open Source implementation of multiple NAT64 RFC for linux"
HOMEPAGE="https://jool.mx/"
IUSE="bash-completion dist-kernel doc iptables +nat64 +siit +tools"
SLOT="0"
LICENSE="GPL-2 doc? ( FDL-1.3 )"
KEYWORDS="~amd64"
SRC_URI="
	https://github.com/NICMx/Jool/releases/download/v${PV}/${P}.tar.gz
	verify-sig? ( https://github.com/NICMx/Jool/releases/download/v${PV}/${P}.tar.gz.asc )
	"

REQUIRED_USE="
	|| ( nat64 siit )
	"

inherit linux-mod bash-completion-r1

# Autotools config
WANT_AUTOCONF='latest'
WANT_LIBTOOL='latest'
AUTOTOOLS_AUTO_DEPEND='no'

# verify-sig config
VERIFY_SIG_OPENPGP_KEY_PATH=

# inherit now that necessary config has been added
inherit verify-sig autotools

DEPEND="
	iptables? ( net-firewall/iptables )
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-kernel/linux-headers
	tools? ( ${AUTOTOOLS_DEPEND} )
	doc? ( www-apps/jekyll )
	dist-kernel? ( virtual/dist-kernel )
"

#TODO: add te following line once the upstream signing keys has been identified and packaged
# verify-sig? ( sec-keys/openpgp-keys- )

# linux-mod config
BUILD_TARGETS='clean modules'
MODULES_NAMES='jool_common(extra:src/mod/common)'

pkg_pretend(){
	use_m 3 13 0 || {
		eerror 'Supported Linux kernels are >= 3.13.0'
		die
	}
	if use siit;then
		MODULES_NAMES+=' jool_siit(extra:src/mod/jool_siit)'
	fi
	if use nat64;then
		MODULES_NAMES+=' jool(extra:src/mod/jool)'
	fi
}

pkg_setup(){
	linux-mod_pkg_setup
}

src_prepare(){
	eautoreconf && econf
}

src_compile(){
	linux-mod_src_compile

	if use tools; then
		emake -C "${S}/src/tools"
	fi

	if use doc; then
		cd docs && jekyll build || die
	fi
}

src_install(){
	default
	if use doc;then
	  dodoc -r docs/_site
	fi
	use bash-completion && dobashcomp src/*/*/*.bash
	dodoc src/*/*/*.?
}

# vim: set syntax=modeline notabexpand
