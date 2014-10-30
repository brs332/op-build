################################################################################
#
# openpower-mrw
#
################################################################################

OPENPOWER_MRW_VERSION = a169ab559ce219f4af045dd95d21376214b3a576
OPENPOWER_MRW_SITE = $(call github,brs332,openpower-mrw,$(OPENPOWER_MRW_VERSION))
OPENPOWER_MRW_LICENSE = Apache-2.0
OPENPOWER_MRW_DEPENDENCIES =

OPENPOWER_MRW_INSTALL_IMAGES = YES
OPENPOWER_MRW_INSTALL_TARGET = NO

OPENPOWER_MRW_ENV_VARS=INSTALL_DIRECTORY=$(STAGING_DIR)/usr/bin/

define OPENPOWER_MRW_BUILD_CMDS
        $(OPENPOWER_MRW_ENV_VARS) bash -c 'cd $(@D) && $(MAKE)'
endef

define OPENPOWER_MRW_INSTALL_IMAGES_CMDS
        $(OPENPOWER_MRW_ENV_VARS) bash -c 'cd $(@D) && $(MAKE) install'
endef

$(eval $(generic-package))
