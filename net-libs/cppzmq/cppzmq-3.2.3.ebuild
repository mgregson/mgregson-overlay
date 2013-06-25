# -*- sh -*- #

EAPI=4

inherit git-2

DESCRIPTION="C++ 0MQ bindings"
HOMEPAGE="https://github.com/zeromq/zeromq"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

EGIT_REPO_URI="git://github.com/zeromq/cppzmq.git"
EGIT_COMMIT="b23297800389149ac37f19b7215fa4734d344998"

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
    insinto /usr/include
    doins zmq.hpp
}
