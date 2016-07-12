# Copyright 2013 Hacking Networked Solutions
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="3"

inherit eutils

DESCRIPTION="A 'wiring' like library for the Raspberry Pi"
HOMEPAGE="http://wiringpi.com/"
SRC_URI="http://downloads.mad-hacking.net/software/wiringPi-${PV}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""

RDEPEND="dev-libs/wiringPi"
DEPEND="${RDEPEND}"

MAKEDIRS="gpio"

src_prepare() {
	epatch "${FILESDIR}/gpio_Makefile.patch"
}

src_compile() {
	for d in ${MAKEDIRS}; do
		cd "${WORKDIR}/wiringPi-${PV}/${d}"	
		emake 
	done
}

src_install() {
	for d in ${MAKEDIRS}; do
		cd "${WORKDIR}/wiringPi-${PV}/${d}"	
		emake DESTDIR="${D}/usr/" PREFIX="" install
	done
}
