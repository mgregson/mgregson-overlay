# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="Nitrogen web framework"
HOMEPAGE="http://nitrogenproject.com"

DEPEND=">=dev-erlang/nprocreg-0.2
        >=dev-erlang/simple-bridge-1.2
        >=dev-erlang/sync-0.1
        dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/nitrogen_core"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/nitrogen/nitrogen_core/archive/v${PV}.tar.gz"

src_unpack()
{
    fw-init --name nitrogen_core --template erlang-rebar --revision none
    mv nitrogen_core "nitrogen_core-${PV}"
    unpack "v${PV}.tar.gz"
    mv "nitrogen_core-${PV}" nitrogen_core
    rm nitrogen_core/src/myapp.erl
    sed -i "s/FW_PACKAGE_VERSION=\"0.0.0\"/FW_PACKAGE_VERSION=\"${PV}\"/g" \
        nitrogen_core/fw-pkgin/config
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
