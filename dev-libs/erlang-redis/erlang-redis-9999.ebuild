# -*- sh -*- #

EAPI="4"
inherit git-2 eutils

SLOT="0"
DESCRIPTION="erl-redis is an Erlang redis client library."
HOMEPAGE="https://github.com/litaocheng/erl-redis"

DEPEND="dev-lang/fw-tmplate-erlang-rebar
        >=dev-lang/erlang-14"

EGIT_REPO_URI="git://github.com/litaocheng/erl-redis.git"
EGIT_MASTER="master"

src_prepare()
{
		epatch "${FILESDIR}/${P}_00-Makefile.patch"
}

src_configure()
{
		true
}

src_compile()
{
		emake || die
}

src_install()
{
		ERLDIR=`erl -noshell -eval 'io:format("~s",[code:lib_dir()])'	-s init stop 2>/dev/null`
		emake ERL_LIB="${D}/${ERLDIR}" install || die
}
