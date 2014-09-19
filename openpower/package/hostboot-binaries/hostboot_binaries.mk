################################################################################
#
# hostboot_binaries
#
################################################################################

HOSTBOOT_BINARIES_VERSION = f06d3d171ed69f0553a3aa02685d232a1dec52dc
HOSTBOOT_BINARIES_SITE = $(call github,sannerd,hostboot-binaries,$(HOSTBOOT_BINARIES_VERSION))
HOSTBOOT_BINARIES_LICENSE = Apache-2.0

HOSTBOOT_BINARIES_INSTALL_IMAGES = YES
HOSTBOOT_BINARIES_INSTALL_TARGET = NO

define HOSTBOOT_BINARIES_INSTALL_IMAGES_CMDS
     $(INSTALL) -D $(@D)/cvpd.bin  $(STAGING_DIR)/hostboot_binaries/cvpd.bin
     $(INSTALL) -D $(@D)/p8.ref_image.hdr.bin.ecc  $(STAGING_DIR)/hostboot_binaries/p8.ref_image.hdr.bin.ecc
     $(INSTALL) -D $(@D)/palmetto_sbec_pad.img.ecc  $(STAGING_DIR)/hostboot_binaries/palmetto_sbec_pad.img.ecc
     $(INSTALL) -D $(@D)/palmetto_sbe.img.ecc  $(STAGING_DIR)/hostboot_binaries/palmetto_sbe.img.ecc
endef

$(eval $(generic-package))
