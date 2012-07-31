# -*- mode: sh; -*- #
EAPI=4
inherit subversion java-pkg-2 java-ant-2

DESCRIPTION="DIagrams Through Ascii Art"
HOMEPAGE="http://ditaa.sourceforge.net"

DEPEND="dev-java/ant
        >=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

KEYWORDS="~amd64 ~x86"
SLOT="0"
ESVN_REPO_URI="https://ditaa.svn.sourceforge.net/svnroot/ditaa/trunk"

src_configure()
{
		ant -f build/release.xml prep || die
}

src_compile()
{
		ant -f build/release.xml release-jar || die
}

src_install()
{
		java-pkg_newjar releases/ditaa0_9.jar
		java-pkg_dolauncher
}