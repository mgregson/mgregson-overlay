# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #

inherit git flag-o-matic eutils libtool autotools

DESCRIPTION="Facebook's Scribe logging server."
HOMEPAGE="https://github.com/facebook/scribe"

EAPI="3"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/thrift-0.7.0[fb303,c++]
        <dev-libs/boost-1.46"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/facebook/scribe.git"
#EGIT_REPO_URI="git://github.com/qualtrics/scribe.git"
EGIT_BRANCH="master"

src_configure()
{
    autoreconf --force --verbose --install
    append-cppflags "-DBOOST_FILESYSTEM_VERSION=2"
    econf --with-thriftpath=/usr --with-fb303path=/usr
}

src_compile()
{
    append-cppflags "-DBOOST_FILESYSTEM_VERSION=2"
    emake || die
}

src_install()
{
    emake DESTDIR="${D}" install || die
}