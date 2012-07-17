# -*- mode: sh; c-basic-offset: 2; indent-tabs-mode: nil; tab-width: 2 -*- #

EAPI="4"

CABAL_FEATURES="lib profile hoogle hscolour"
inherit haskell-cabal

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

HOMEPAGE="https://github.com/yesodweb/Shelly.hs"
DESCRIPTION="Shelly provides convenient systems programming in Haskell, similar in spirit to POSIX shells."
RDEPEND="dev-haskell/mtl
         <dev-haskell/unix-compat-0.4
         dev-haskell/time
         dev-haskell/text
         <dev-haskell/system-filepath-0.5
         <dev-haskell/system-fileio-0.4"
DEPEND="${RDEPEND}"

SRC_URI="http://hackage.haskell.org/packages/archive/${PN}/${PV}/${P}.tar.gz"
