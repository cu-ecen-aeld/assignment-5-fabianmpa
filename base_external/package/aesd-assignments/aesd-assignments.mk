
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#Note: Latest commit is added, build works starting 57c5caf81dcab911472d809834a5c1eb3cff50a4
AESD_ASSIGNMENTS_VERSION = 3457349be343f9b39d65e6d2f556fed481f85b26
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-fabianmpa.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all CROSS_COMPILE=true
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0777 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0777 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/s99aesdsocket
endef


$(eval $(generic-package))
