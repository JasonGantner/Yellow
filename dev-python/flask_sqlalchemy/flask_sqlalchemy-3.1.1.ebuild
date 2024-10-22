# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=(python3_{11..13} python3_13t)

inherit distutils-r1 pypi

DESCRIPTION="Add SQLAlchemy support to your Flask application."
HOMEPAGE="https://pypi.org/project/Flask-SQLAlchemy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/flask-2.2.5
	>=dev-python/sqlalchemy-2.0.16
"

distutils_enable_tests pytest
