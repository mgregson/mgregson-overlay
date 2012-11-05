# -*- mode: sh; -*- #

EAPI="3"
inherit subversion eutils

DESCRIPTION="Framewerk revision control plugins"
HOMEPAGE="http://fwtemplates.googlecode.com"

IUSE=""

IUSE=""

DEPEND="dev-lang/framewerk"
KEYWORDS="~amd64 ~x86"
SLOT="0"
ESVN_REPO_URI="http://fwtemplates.googlecode.com/svn/trunk/fw-template-revision"

src_configure()
{
		fw-bootstrap --fw_version "0.0.0" --name fw-revision --revision none --template fw-template --template_type fw-revision
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
