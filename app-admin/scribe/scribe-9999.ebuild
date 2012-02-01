# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #

inherit git
inherit eutils
inherit libtool
inherit autotools

DESCRIPTION="Facebook's Scribe logging server."
HOMEPAGE="https://github.com/facebook/scribe"

EAPI="3"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-libs/thrift
        dev-libs/fb303
        <dev-libs/boost-1.46"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://github.com/facebook/scribe.git"
#EGIT_REPO_URI="git://github.com/qualtrics/scribe.git"
EGIT_BRANCH="master"

src_configure()
{
    sh bootstrap.sh --with-thriftpath=/usr --with-fb303path=/usr
}

src_compile()
{
    emake || die
}

src_install()
{
    emake DESTDIR="${D}" install || die
}