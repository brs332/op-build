################################################################################
#
# common-xml
#
################################################################################
COMMON_XML_VERSION = 66c173fae20d71d7e8b39ba6e48255d93de21e07
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
