# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="MochiWeb is an Erlang library for building lightweight HTTP servers."
HOMEPAGE="https://github.com/mochi/mochiweb"

DEPEND="dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/${PN}"
KEYWORDS="~x86 ~amd64"

src_unpack()
{
		fw-init --name mochiweb --template erlang-rebar --revision none --wrap_git_path "git://github.com/mochi/mochiweb.git" || die
}

src_configure()
{
		./bootstrap || die
		econf --disable-erlrc || die
}

src_compile()
{
		emake || die
}

src_install()
{
		emake DESTDIR="${D}" install || die
}
