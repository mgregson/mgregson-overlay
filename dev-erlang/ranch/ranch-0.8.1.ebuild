# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="Process registry used by Nitrogen"
HOMEPAGE="https://github.com/extend/ranch"

DEPEND="dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/${PN}"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/extend/${PN}/archive/${PV}.tar.gz"

src_unpack()
{
    fw-init --name "${PN}" --template erlang-rebar --revision none
    rm "${PN}/src/myapp.erl"
    mv "${PN}" "${PN}-${PV}"
    unpack "${PV}.tar.gz"
    mv "${PN}-${PV}" "${PN}"
    sed -i "s/FW_PACKAGE_VERSION=\"0.0.0\"/FW_PACKAGE_VERSION=\"${PV}\"/g" \
        "${PN}/fw-pkgin/config"
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
