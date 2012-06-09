# -*- mode: sh; -*- #

EAPI="3"
inherit eutils
inherit libtool
inherit autotools

DESCRIPTION="Apache Thrift RPC library"
HOMEPAGE="http://thrift.apache.com"

IUSE="-fb303"

DEPEND=">=dev-libs/boost-1.34.0
        virtual/yacc
        >=sys-devel/gcc-3.3.5
        dev-libs/glib
        dev-libs/libevent
        sys-libs/zlib
        >=dev-lang/mono-1.2.4
        >=virtual/jdk-1.5.0
        dev-java/ant
        dev-java/ant-ivy
        dev-java/commons-lang
        dev-java/slf4j-api
        >=dev-lang/python-2.4
        >=dev-lang/php-5.0
        >=dev-lang/ruby-1.8
        >=dev-lang/erlang-12.0
        >=dev-lang/perl-5.0
        dev-perl/Bit-Vector
        dev-perl/Class-Accessor"

KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://archive.apache.org/dist/incubator/thrift/0.5.0-incubating/thrift-0.5.0.tar.gz"

src_prepare()
{
		eautoreconf
		if use fb303
		then
				einfo "Bootstrapping for fb303..."
				cd contrib/fb303;
				sh bootstrap.sh
				cd -;
		fi
}

src_configure()
{
		chmod +x configure
		econf
		if use fb303
		then
				einfo "Running configure for fb303..."
				cd contrib/fb303;
				econf
				cd -;
		fi
}

src_compile()
{
		emake || die
		if use fb303
		then
				einfo "Running make for fb303..."
				cd contrib/fb303;
				emake || die
				cd -;
		fi
}

src_install()
{
		emake DESTDIR="${D}" install || die
		if use fb303
		then
				einfo "Running 'make install' for fb303..."
				cd contrib/fb303;
				emake DESTDIR="${D}" install || die
				cd -;
		fi
}