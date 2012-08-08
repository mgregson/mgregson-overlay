# -*- mode: sh; c-basic-offset: 2 indent-tabs-mode: nil; tab-width: 2 -*- #

EAPI=4

inherit git

DESCRIPTION="vpnc-compatible script for openconnect - sets up routing and DNS"
HOMEPAGE="http://git.infradead.org/users/dwmw2/vpnc-scripts.git"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

EGIT_REPO_URI="git://git.infradead.org/users/dwmw2/vpnc-scripts.git"
EGIT_BRANCH="master"

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
    dobin vpnc-script
}