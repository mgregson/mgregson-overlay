# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #
EAPI="3"
inherit git-2

DESCRIPTION="Chicken egg with a QobiScheme-compatible define-structure macro"
HOMEPAGE="https://github.com/abarbu/define-structure"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-scheme/chicken
        >=dev-scheme/chicken-nondeterminism-1.0"

EGIT_REPO_URI="git://github.com/abarbu/define-structure.git"
EGIT_COMMIT="1.0"

src_configure()
{
		true
}

src_compile()
{
		true
}

src_install()
{
		chicken-install -p "${D}/usr/" || die
}
