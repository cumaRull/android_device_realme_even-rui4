#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Dalvik VM Configuration
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
    
# Dynamic Partition
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# The first api level, device has been commercially launched on.
PRODUCT_SHIPPING_API_LEVEL := 30

# Extra VNDK Versions
PRODUCT_EXTRA_VNDK_VERSIONS := 31

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.even

# Biometrics
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.even

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml


# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

# System prop
-include $(DEVICE_PATH)/system_prop.mk
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/etc/fstab.mt6768:$(TARGET_COPY_OUT_RAMDISK)/fstab.mt6768
    
# Init
PRODUCT_PACKAGES += \
    init.mt6768.rc \
    fstab.mt6768    
    
# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay
    

# Permissions
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/permissions/privapp-permissions-mediatek.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-mediatek.xml
    

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.even

# RRO-Overlays
PRODUCT_PACKAGES += \
    TetheringConfigOverlay \
    WifiOverlay

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    SecureElement \
    Tag

# DRM
PRODUCT_PACKAGES += \
    libdrm

# KPOC
PRODUCT_PACKAGES += \
    libsuspend

# Inherit the proprietary files
$(call inherit-product, vendor/realme/even/even-vendor.mk)

# InCall Service
PRODUCT_PACKAGES += \
    MtkInCallService

# IMS
PRODUCT_BOOT_JARS += \
    mediatek-common \
    mediatek-framework \
    mediatek-ims-base \
    mediatek-ims-common \
    mediatek-telecom-common \
    mediatek-telephony-base \
    mediatek-telephony-common
    
# HIDL
PRODUCT_PACKAGES += \
    libhardware \
    libhidltransport \
    libhwbinder

# Bluetooth Audio (System-side HAL, sysbta)
PRODUCT_PACKAGES += \
    audio.sysbta.default \
    android.hardware.bluetooth.audio-service-system

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration.xml \
    $(DEVICE_PATH)/bluetooth/audio/config/sysbta_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysbta_audio_policy_configuration_7_0.xml
        
    
