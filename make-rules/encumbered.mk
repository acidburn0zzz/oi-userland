#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2015 Alexander Pyhalov
#

WS_REPO =       $(WS_TOP)/$(MACH)/encumbered-repo

COMPONENT_PKGLINT_ENV += ENCUMBERED=true

PUBLISHER  = hipster-encumbered

BASS_O_MATIC =  $(WS_TOOLS)/bass-o-matic --subdir=components/encumbered

ENCUMBERED = encumbered/

# If a component needs ffmpeg libraries then it also needs ffmpeg development
# files (the video/ffmpeg package) for building.  To avoid the need to manually
# add the video/ffmpeg package into the REQUIRED_PACKAGES list of all
# components that needs it we do so automatically here.
#
# Since both ffmpeg libraries and the video/ffmpeg packages are encumbered we
# do this here instead of ips.mk.
REQUIRED_PACKAGES_TRANSFORM += -e '/ library\/ffmpeg/a\$(newline)REQUIRED_PACKAGES += video/ffmpeg'
