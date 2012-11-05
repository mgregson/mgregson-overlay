# -*- mode: sh; -*- #

EAPI="3"
inherit subversion
inherit eutils

DESCRIPTION="Framewerk template for rebar projects"
HOMEPAGE="http://fwtemplates.googlecode.com"

IUSE=""

DEPEND="dev-lang/framewerk"
KEYWORDS="~amd64 ~x86"
SLOT="0"
ESVN_REPO_URI="http://fwtemplates.googlecode.com/svn/trunk/fw-template-erlang-rebar"

src_configure()
{
		fw-bootstrap --name fw-template-erlang-rebar --revision none --template fw-template --template_type erlang-rebar
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
