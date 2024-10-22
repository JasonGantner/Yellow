# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=(python3_{11..13} python3_13t)

inherit distutils-r1 pypi

DESCRIPTION="Smart object creation facility for Django"
HOMEPAGE="https://pypi.org/project/model_bakery/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=dev-python/django-4.2"
RDEPEND="${DEPEND}"
RESTRICT="test" # ruff is not stable yet
#BDEPEND="
#	test? (
#	dev-python/coverage
#	dev-python/pillow
#	dev-python/pytest
#	dev-python/pytest-django
#	dev-python/black
#	dev-python/ruff
#	dev-python/mypy
#	)
#"

#distutils_enable_tests pytest
