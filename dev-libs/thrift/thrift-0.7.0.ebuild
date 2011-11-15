# -*- mode: sh; -*- #

inherit eutils
inherit libtool
inherit autotools

EAPI="3"
DESCRIPTION="Apache Thrift RPC library"
HOMEPAGE="http://thrift.apache.com"

IUSE="+c +c++ -csharp -java -python -php -ruby -erlang -perl -haskell -fb303"

DEPEND=">=dev-libs/boost-1.34.0
        virtual/yacc
        >=sys-devel/gcc-3.3.5"
RDEPEND="${DEPEND}
         c? ( dev-libs/glib )
         c++? ( dev-libs/libevent
                sys-libs/zlib )
         csharp? ( >=dev-lang/mono-1.2.4 )
         java? ( >=virtual/jdk-1.5.0
                 dev-java/ant
                 dev-java/ant-ivy
                 dev-java/commons-lang
                 dev-java/slf4j-api )
         python? ( >=dev-lang/python-2.4 )
         php? ( >=dev-lang/php-5.0 )
         ruby? ( >=dev-lang/ruby-1.8 )
         erlang? ( >=dev-lang/erlang-12.0 )
         perl? ( >=dev-lang/perl-5.0
                 dev-perl/Bit-Vector
                 dev-perl/Class-Accessor )"

KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://apache.raffsoftware.com/${PN}/${PV}/${P}.tar.gz"

src_prepare()
{
		wget "https://issues.apache.org/jira/secure/attachment/12494377/thrift-857.patch"
		epatch thrift-857.patch
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
		econf \
				$(use_enable c gen-c_glib) \
				$(use_with c c_glib) \
				$(use_enable c++ ge-cpp) \
				$(use_with c++ cpp) \
				$(use_enable java gen-java) \
				$(use_with java) \
				$(use_enable python gen-py) \
				$(use_with python) \
				$(use_enable ruby gen-rb) \
				$(use_with ruby) \
				$(use_enable erlang gen-erl) \
				$(use_with erlang) \
				$(use_enable csharp gen-csharp) \
				$(use_with csharp) \
				$(use_enable php gen-php) \
				$(use_with php) \
				$(use_enable perl gen-perl) \
				$(use_with perl) \
				$(use_enable haskell gen-hs) \
				$(use_with haskell)
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
				emake DESTDIR="${D}" install | die
				cd -;
		fi
}