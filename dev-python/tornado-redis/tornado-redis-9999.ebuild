# -*- mode: sh -*- #

EAPI="4"
inherit git-2 python distutils

SLOT="0"
DESCRIPTION="tornado-redis is a Redis client library integrated with tornado"
HOMEPAGE="https://github.com/leporo/tornado-redis"
KEYWORDS="~x86 ~amd64"

DEPEND="www-servers/tornado"

EGIT_REPO_URI="https://github.com/leporo/tornado-redis.git"
