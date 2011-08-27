# -*- mode: sh; -*- #
inherit git

DESCRIPTION="Elim Instant Messanger stack and Garak client implementation for emacs."
HOMEPAGE=""

SLOT="0"


EGIT_REPO_URI="git://git.sv.gnu.org/elim.git"
EGIT_BRANCH="master"

src_compile() {
		emake || die
}

src_install() {
#TODO:
# Figure out an install process for this thing
		dodoc AUTHORS CHANGES COPYING MEDIA MAKEFILE TODO || die
}