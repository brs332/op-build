################################################################################
#
# common-xml
#
################################################################################
COMMON_XML_VERSION = cb1a389b34ef2506c84bdf51d16091d0e5b2772b
COMMON_XML_SITE = $(call github,brs332,common-xml,$(COMMON_XML_VERSION))
COMMON_XML_LICENSE = Apache-2.0
COMMON_XML_DEPENDENCIES =

COMMON_XML_INSTALL_IMAGES = YES
COMMON_XML_INSTALL_TARGET = NO

XML_INSTALL_DIRECTORY=$(STAGING_DIR)/openpower_mrw_scratch/

define COMMON_XML_INSTALL_IMAGES_CMDS
        bash -c 'mkdir -p $(XML_INSTALL_DIRECTORY) && cp -r $(@D)/* $(XML_INSTALL_DIRECTORY)'
endef

$(eval $(generic-package))
