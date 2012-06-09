# -*- mode: sh; -*- #

EAPI="3"
inherit eutils

DESCRIPTION="Dukes of Erl Framewerk"
HOMEPAGE="http://fwtemplates.googlecode.com"

IUSE=""

DEPEND=">=sys-devel/autoconf-2.5
        >=sys-devel/automake-1.9
        sys-devel/make
        dev-vcs/cvs
        dev-lang/perl"

KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://fwtemplates.googlecode.com/files/framewerk-${PV}.tar.gz"

src_prepare()
{
		./bootstrap
}

src_configure()
{
		true
}

src_compile()
{
		./build --prefix=${D}/usr
}

src_test()
{
		make -s check
}

src_install()
{
		make install
}