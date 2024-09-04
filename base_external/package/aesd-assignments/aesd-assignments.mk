
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#Note: Latest commit is added, build works starting 57c5caf81dcab911472d809834a5c1eb3cff50a4
AESD_ASSIGNMENTS_VERSION = 3cc5c34dc46ef650c6e74291f943898d597639a7
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-fabianmpa.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0777 $(@D)/finder-app/writer.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0777 $(@D)/finder-app/finder.sh $(TARGET_DIR)/bin
	$(INSTALL) -m 0777 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/bin
	$(INSTALL) -D -m 0777 $(@D)/finder-app/*.out $(TARGET_DIR)/bin
endef

$(eval $(generic-package))
