# -*- mode: sh; -*- #

inherit eutils

EAPI="3"
DESCRIPTION="Framewerk template for erlang projects"
HOMEPAGE="http://fwtemplates.googlecode.com"

IUSE=""

DEPEND="dev-lang/framewerk"
KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://fwtemplates.googlecode.com/files/fw-template-erlang-0.1.53.tar.gz"

src_configure()
{
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
