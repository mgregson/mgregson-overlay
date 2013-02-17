# -*- sh -*- #

EAPI="4"

SLOT="0"
DESCRIPTION="On-the-fly recompiling and reloading in Erlang."
HOMEPAGE="https://github.com/rustyio/sync"

DEPEND="dev-lang/fw-template-erlang-rebar
        >=dev-lang/erlang-14"

S="${WORKDIR}/${PN}"
KEYWORDS="~x86 ~amd64"

src_unpack()
{
		fw-init --name "${PN}" --template erlang-rebar --revision none --wrap_git_path "git://github.com/rustyio/sync.git" || die
    sed -i "s/FW_PACKAGE_VERSION=\"0.0.0\"/FW_PACKAGE_VERSION=\"${PV}\"/g" \
        nitrogen_core/fw-pkgin/config
}

src_configure()
{
		./bootstrap || die
		econf || die
}

src_compile()
{
		emake || die
}

src_install()
{
		emake DESTDIR="${D}" install || die
}
