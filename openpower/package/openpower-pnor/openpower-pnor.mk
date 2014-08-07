################################################################################
#
# openpower_pnor
#
################################################################################

# remove the quotes from the XML/Targeting package as
# make doesn't care for quotes in the dependencies.
XML_PACKAGE=$(subst $\",,$(BR2_OPENPOWER_XML_PACKAGE))

OPENPOWER_PNOR_VERSION = 0855f1b9683e13583248a64454fe13fb02fd1b87
OPENPOWER_PNOR_SITE = $(call github,open-power,pnor,$(OPENPOWER_PNOR_VERSION))
OPENPOWER_PNOR_LICENSE = Apache-2.0
OPENPOWER_PNOR_DEPENDENCIES = hostboot hostboot-binaries $(XML_PACKAGE) skiboot host-openpower-ffs

OPENPOWER_PNOR_INSTALL_IMAGES = YES
OPENPOWER_PNOR_INSTALL_TARGET = NO

OPENPOWER_TARGETING_DIR=$(STAGING_DIR)/$(XML_PACKAGE)/
HOSTBOOT_IMAGE_DIR=$(STAGING_DIR)/hostboot_build_images/
HOSTBOOT_BINARY_DIR = $(STAGING_DIR)/hostboot_binaries/
OPENPOWER_PNOR_SCRATCH_DIR = $(STAGING_DIR)/openpower_pnor_scratch/

define OPENPOWER_PNOR_INSTALL_IMAGES_CMDS
        mkdir -p $(OPENPOWER_PNOR_SCRATCH_DIR)
        $(TARGET_MAKE_ENV) $(@D)/update_image_$(BR2_OPENPOWER_CONFIG_NAME).pl -op_target_dir $(OPENPOWER_TARGETING_DIR) -hb_image_dir $(HOSTBOOT_IMAGE_DIR) -scratch_dir $(OPENPOWER_PNOR_SCRATCH_DIR) -hb_binary_dir $(HOSTBOOT_BINARY_DIR) -targeting_binary_filename $(BR2_PALMETTO_TARGETING_ECC_FILENAME) -targeting_binary_source $(BR2_PALMETTO_TARGETING_BIN_FILENAME)

        mkdir -p $(STAGING_DIR)/pnor/
        $(TARGET_MAKE_ENV) $(@D)/create_pnor_image.pl -xml_layout_file $(@D)/$(BR2_OPENPOWER_PNOR_XML_LAYOUT_FILENAME) -pnor_filename $(STAGING_DIR)/pnor/$(BR2_OPENPOWER_PNOR_FILENAME) -hb_image_dir $(HOSTBOOT_IMAGE_DIR) -scratch_dir $(OPENPOWER_PNOR_SCRATCH_DIR) -outdir $(STAGING_DIR)/pnor/ -payload $(BINARIES_DIR)/$(BR2_SKIBOOT_LID_NAME) -sbe_binary_filename $(BR2_HOSTBOOT_BINARY_SBE_FILENAME) -sbec_binary_filename $(BR2_HOSTBOOT_BINARY_SBEC_FILENAME) -targeting_binary_filename $(BR2_PALMETTO_TARGETING_ECC_FILENAME)

	$(INSTALL) $(STAGING_DIR)/pnor/$(BR2_OPENPOWER_PNOR_FILENAME) $(BINARIES_DIR)
endef

$(eval $(generic-package))
