# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="erl-redis is an Erlang redis client library."
HOMEPAGE="https://github.com/wooga/eredis"

DEPEND="dev-lang/fw-tmplate-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/${PN}"

src_unpack()
{
		fw-init --name eredis --template erlang-rebar --revision none --wrap_git_path "git://github.com/wooga/eredis.git" || die
}

src_configure()
{
    ./bootstrap || die
    econf || die
}

src_compile()
{
		emake || die
}

src_install()
{
    emake DESTDIR="${D}" install || die
}
