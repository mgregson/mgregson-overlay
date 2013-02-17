# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="Erlang MIME types library."
HOMEPAGE="https://github.com/spawngrid/mimetypes"

DEPEND="dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/${PN}"
KEYWORDS="~x86 ~amd64"
SRC_URI="https://github.com/spawngrid/${PN}/archive/${PV}.tar.gz"

src_unpack()
{
    fw-init --name "${PN}" --template erlang-rebar --revision none
    mv "${PN}" "mimetypes-${PV}"
    unpack "${PV}.tar.gz"
    mv "${PN}-${PV}" "${PN}"
    rm "${PN}/src/myapp.erl"
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

    # Dirty hack to initialize types database
    erl -pa "${D}/usr/lib64/erlang/lib/${PN}-${PV}/ebin" \
        -noshell -eval '{ok,_}=mimetypes:init([])' -s init stop || die
}
