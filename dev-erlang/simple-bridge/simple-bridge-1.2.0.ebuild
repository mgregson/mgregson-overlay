# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="Nitrogen web framework"
HOMEPAGE="http://nitrogenproject.com"

DEPEND="dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14
        >=dev-erlang/mimetypes-1.0"

S="${WORKDIR}/simple_bridge"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/nitrogen/simple_bridge/archive/v${PV}.tar.gz"

src_unpack()
{
    fw-init --name simple_bridge --template erlang-rebar --revision none
    mv simple_bridge "simple_bridge-${PV}"
    unpack "v${PV}.tar.gz"
    mv "simple_bridge-${PV}" simple_bridge
    rm simple_bridge/src/myapp.erl
    sed -i "s/FW_PACKAGE_VERSION=\"0.0.0\"/FW_PACKAGE_VERSION=\"${PV}\"/g" \
        simple_bridge/fw-pkgin/config
    sed -i "s/{mimetypes, .*}}}//g" simple_bridge/rebar.config
}

src_configure()
{
    ./bootstrap || die
    econf --disable-erlrc || die
}

src_compile()
{
    emake || die
}

src_install()
{
    emake DESTDIR="${D}" install || die
}
