# -*- mode: sh; -*- #

inherit eutils

EAPI="3"
DESCRIPTION="erlrc erlang hot code loading framework"
HOMEPAGE="http://code.google.com/p/erlrc/"

IUSE=""

DEPEND="sys-devel/make"

KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz"

src_unpack()
{
		unpack ${A}
		cd ${S}

		epatch "${FILESDIR}"/"${P}-regexp.patch"
}

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
