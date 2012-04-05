# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #

inherit git flag-o-matic eutils libtool autotools

DESCRIPTION="Basho Rebar"
HOMEPAGE="https://github.com/basho/rebar"

EAPI="3"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-lang/erlang-13.2.4"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/basho/rebar.git"
EGIT_BRANCH="master"

src_configure()
{
  true
}

src_compile()
{
  chmod +x bootstrap.sh
  ./bootstrap.sh
}

src_install()
{
  dobin rebar
}