include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=Ci40_pump_monitor
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/Ci40_pump_monitor
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=Ci40 pump monitor 
	DEPENDS:=+awalwm2m +letmecreate
endef

define Package/Ci40_pump_monitor/description
	Ci40 application to detect when a pump overflow switch is triggered
endef

TARGET_CFLAGS += -I$(STAGING_DIR)/usr/include
TARGET_LDFLAGS += -L$(STAGING_DIR)/usr/lib

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) src/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/Ci40_pump_monitor/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/Ci40_pump_monitor $(1)/bin/
endef

$(eval $(call BuildPackage,Ci40_pump_monitor))
