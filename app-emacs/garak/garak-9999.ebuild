# -*- mode: sh; -*- #
inherit git
inherit flag-o-matic
inherit elisp-common

EAPI=3
DESCRIPTION="Elim Instant Messanger stack and Garak client implementation for emacs."
HOMEPAGE=""
DEPEND=">=virtual/emacs-${NEED_EMACS:-21} >=net-im/pidgin-2.4.3 dev-libs/glib:2 dev-libs/libxml2"
RDEPEND="${DEPEND}"

SLOT="0"


EGIT_REPO_URI="git://git.sv.gnu.org/elim.git"
EGIT_BRANCH="master"

src_compile() {
		# Gentoo default ldflags explodes this build.  Strip off some flags and add
		# them back to fix.
		filter-ldflags "-Wl,-O1" "-Wl,--as-needed"
		append-ldflags "-Wl" "-O1" "--as-needed"

		einfo \
"Standard Gentoo LDFLAGS causes this build to fail.  If you use custom LDFLAGS
they will be ignored.  Submit patches to the ebuild if you don't like this."

		emake || die
}

src_install() {
		MY_DESTDIR_BASE=/usr/share/emacs/site-lisp/elim
		SUBDIRS="data elisp graphics icons"

		dodir $MY_DESTDIR_BASE
		exeinto $MY_DESTDIR_BASE
		doexe elim-client || die

		for subdir in $SUBDIRS
		do
				dodir $MY_DESTDIR_BASE/$subdir
				insinto $MY_DESTDIR_BASE/$subdir
				doins $subdir/* || die
		done


		dodoc AUTHORS CHANGES COPYING MEDIA TODO || die
		dodoc doc/*.txt || die
}