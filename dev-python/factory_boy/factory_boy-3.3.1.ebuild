# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{11..13} python3_13t)

inherit distutils-r1 pypi

DESCRIPTION="A versatile test fixtures replacement based on thoughtbot's factory_bot for Ruby"
HOMEPAGE="https://pypi.org/project/factory_boy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/Faker"
RDEPEND="${DEPEND}"
BDEPEND="
	test? (
		dev-python/flask_sqlalchemy
	)
"

distutils_enable_tests pytest
