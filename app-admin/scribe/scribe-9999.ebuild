# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #
EAPI="3"
inherit git flag-o-matic eutils libtool autotools

DESCRIPTION="Facebook's Scribe logging server."
HOMEPAGE="https://github.com/facebook/scribe"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/thrift-0.7.0[fb303,c++]
        >=dev-libs/boost-1.49"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/mgregson/scribe.git"
#EGIT_REPO_URI="git://github.com/qualtrics/scribe.git"
EGIT_BRANCH="master"

src_configure()
{
    autoreconf --force --install
    append-flags "-DHAVE_NETINET_IN_H -DHAVE_INTTYPES_H"
    econf --with-thriftpath=/usr --with-fb303path=/usr
}

src_compile()
{
    emake || die
}

src_install()
{
    emake DESTDIR="${D}" install || die
}
