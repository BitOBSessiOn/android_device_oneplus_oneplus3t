# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

BOARD_PATH := device/oneplus/oneplus3t

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8996

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
#TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true

#ENABLE_CPUSETS := true

# Boot image
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom androidboot.bootdevice=624000.ufshc androidboot.selinux=permissive user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff enforcing=0
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
#BOARD_KERNEL_TAGS_OFFSET := 0x02000000
#BOARD_RAMDISK_OFFSET := 0x01000000

BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Build kernel from source
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
#TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_APPEND_DTB := true
#TARGET_KERNEL_SOURCE := kernel/oneplus/msm8996
#TARGET_KERNEL_CONFIG := bito_oneplus3_defconfig

# Prebuilt kernel
TARGET_PREBUILT_KERNEL := $(BOARD_PATH)/Image.gz-dtb

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x0004000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x0004000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x00BC000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x1C4E07B000
BOARD_CACHEIMAGE_PARTITION_SIZE    := 0x0010000000
BOARD_FLASH_BLOCK_SIZE := 0x40000

# Global
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

#COMMON_GLOBAL_CFLAGS += -DSNDRV_COMPRESS_SET_NEXT_TRACK_PARAM

# exFAT drivers included in the kernel
TW_NO_EXFAT_FUSE := true

# Time Daemon
#BOARD_USES_QC_TIME_SERVICES := true

# Disable secure discard because it's SLOW
BOARD_SUPPRESS_SECURE_ERASE := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TARGET_KEYMASTER_WAIT_FOR_QSEE := true
#TARGET_CRYPTFS_HW_PATH := $(BOARD_PATH)/cryptfs_hw

# Increase coldboot timeout
#TARGET_INCREASES_COLDBOOT_TIMEOUT := true

# Recovery:Start
#TARGET_RECOVERY_FSTAB := $(BOARD_PATH)/configs/fstab.qcom
TW_THEME := portrait_hdpi
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_LANGUAGE := en-US
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true
TW_DEFAULT_BRIGHTNESS := 60
TW_INCLUDE_NTFS_3G := true

# Debug flags
#TWRP_INCLUDE_LOGCAT := true

# MR config. MultiROM also uses parts of TWRP config
TARGET_RECOVERY_IS_MULTIROM := true
MR_NO_KEXEC := 2
MR_ALLOW_NKK71_NOKEXEC_WORKAROUND := true
MR_CONTINUOUS_FB_UPDATE := true
MR_DPI := xhdpi
MR_DPI_FONT := 340
MR_USE_MROM_FSTAB := true
MR_FSTAB := $(BOARD_PATH)/multirom/mrom.fstab
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(BOARD_PATH)/multirom/mr_init_devices.c
MR_KEXEC_MEM_MIN := 0x00200000
MR_KEXEC_DTB := true
MR_DEVICE_HOOKS := $(BOARD_PATH)/multirom/mr_hooks.c
MR_DEVICE_HOOKS_VER := 4
MR_DEVICE_VARIANTS := oneplus3 OnePlus3 oneplus3t OnePlus3T
MR_USE_QCOM_OVERLAY := true
MR_QCOM_OVERLAY_HEADER := $(BOARD_PATH)/multirom/mr_qcom_overlay.h
MR_QCOM_OVERLAY_CUSTOM_PIXEL_FORMAT := MDP_RGBX_8888
# bootmenu
DEVICE_RESOLUTION := 1080x1920
MR_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_GRAPHICS_USE_LINELENGTH := true
MR_DEV_BLOCK_BOOTDEVICE := true

#Force populating /dev/block/platform/msm_sdcc.1/by-name
#from the emmc
MR_POPULATE_BY_NAME_PATH := "/dev/block/platform/msm_sdcc.1/by-name"
