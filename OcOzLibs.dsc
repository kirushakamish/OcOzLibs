[Defines]
  PLATFORM_NAME           = OcOzLibs
  PLATFORM_GUID           = 765D4A97-D494-420F-B5CC-74937450AB67
  PLATFORM_VERSION        = 1.0
  SUPPORTED_ARCHITECTURES = X64|IA32
  BUILD_TARGETS           = RELEASE|DEBUG
  SKUID_IDENTIFIER        = DEFAULT
  DSC_SPECIFICATION       = 0x00010006

[LibraryClasses]
  BaseLib|MdePkg/Library/BaseLib/BaseLib.inf
  BaseMemoryLib|MdePkg/Library/BaseMemoryLibRepStr/BaseMemoryLibRepStr.inf
  BaseOverflowLib|MdePkg/Library/BaseOverflowLib/BaseOverflowLib.inf
  CommonMemoryAllocationLib|MdeModulePkg/Library/CommonMemoryAllocationLib/CommonMemoryAllocationLib.inf
  DebugLib|OpenCorePkg/Library/OcDebugLibProtocol/OcDebugLibProtocol.inf
  DebugPrintErrorLevelLib|MdePkg/Library/BaseDebugPrintErrorLevelLib/BaseDebugPrintErrorLevelLib.inf
  DevicePathLib|MdePkg/Library/UefiDevicePathLib/UefiDevicePathLib.inf
  HobLib|MdePkg/Library/DxeHobLib/DxeHobLib.inf
  IoLib|MdePkg/Library/BaseIoLibIntrinsic/BaseIoLibIntrinsic.inf
  MemoryAllocationLib|MdePkg/Library/UefiMemoryAllocationLib/UefiMemoryAllocationLib.inf
  MemoryProfileLib|MdeModulePkg/Library/BaseMemoryProfileLibNull/BaseMemoryProfileLibNull.inf
  OcAppleKernelLib|OcOzLibs/Library/OcAppleKernelLib/OcAppleKernelLib.inf
  OcCompressionLib|OpenCorePkg/Library/OcCompressionLib/OcCompressionLib.inf
  OcCpuLib|OpenCorePkg/Library/OcCpuLib/OcCpuLib.inf
  OcDataHubLib|OpenCorePkg/Library/OcDataHubLib/OcDataHubLib.inf
  OcDevicePathLib|OpenCorePkg/Library/OcDevicePathLib/OcDevicePathLib.inf
  OcDirectResetLib|OpenCorePkg/Library/OcDirectResetLib/OcDirectResetLib.inf
  OcFileLib|OpenCorePkg/Library/OcFileLib/OcFileLib.inf
  OcFlexArrayLib|OpenCorePkg/Library/OcFlexArrayLib/OcFlexArrayLib.inf
  OcMachoLib|OcOzLibs/Library/OcMachoLib/OcMachoLib.inf
  OcMiscLib|OpenCorePkg/Library/OcMiscLib/OcMiscLib.inf
  OcStringLib|OpenCorePkg/Library/OcStringLib/OcStringLib.inf
  OcVariableLib|OpenCorePkg/Library/OcVariableLib/OcVariableLib.inf
  OcXmlLib|OpenCorePkg/Library/OcXmlLib/OcXmlLib.inf
  PcdLib|MdePkg/Library/BasePcdLibNull/BasePcdLibNull.inf
  PciCf8Lib|MdePkg/Library/BasePciCf8Lib/BasePciCf8Lib.inf
  PciLib|MdePkg/Library/BasePciLibCf8/BasePciLibCf8.inf
  PlatformHookLib|MdeModulePkg/Library/BasePlatformHookLibNull/BasePlatformHookLibNull.inf
  PrintLib|MdePkg/Library/BasePrintLib/BasePrintLib.inf
  RegisterFilterLib|MdePkg/Library/RegisterFilterLibNull/RegisterFilterLibNull.inf
  SerialPortLib|MdeModulePkg/Library/BaseSerialPortLib16550/BaseSerialPortLib16550.inf
  SortLib|MdeModulePkg/Library/UefiSortLib/UefiSortLib.inf
  UefiBootServicesTableLib|MdePkg/Library/UefiBootServicesTableLib/UefiBootServicesTableLib.inf
  UefiDriverEntryPoint|OpenCorePkg/Library/OcDriverEntryPoint/UefiDriverEntryPoint.inf
  UefiLib|MdePkg/Library/UefiLib/UefiLib.inf
  UefiRuntimeServicesTableLib|MdePkg/Library/UefiRuntimeServicesTableLib/UefiRuntimeServicesTableLib.inf

[Components]
  OcOzLibs/OcOzLibs.inf
  OcOzLibs/Library/OcAppleKernelLib/OcAppleKernelLib.inf
  OcOzLibs/Library/OcMachoLib/OcMachoLib.inf

[PcdsFixedAtBuild]
  gEfiMdePkgTokenSpaceGuid.PcdMaximumAsciiStringLength|0
!if $(TARGET) == RELEASE
  # DEBUG_PRINT_ENABLED
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|2
  # DEBUG_ERROR | DEBUG_WARN
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000002
  gEfiMdePkgTokenSpaceGuid.PcdFixedDebugPrintErrorLevel|0x80000002
!else
  # DEBUG_ASSERT_ENABLED | DEBUG_PRINT_ENABLED | DEBUG_CODE_ENABLED | CLEAR_MEMORY_ENABLED | ASSERT_DEADLOOP_ENABLED
  gEfiMdePkgTokenSpaceGuid.PcdDebugPropertyMask|0x2f
  # DEBUG_ERROR | DEBUG_WARN | DEBUG_INFO
  gEfiMdePkgTokenSpaceGuid.PcdDebugPrintErrorLevel|0x80000042
  gEfiMdePkgTokenSpaceGuid.PcdFixedDebugPrintErrorLevel|0x80000042
!endif
  gOpenCorePkgTokenSpaceGuid.PcdCanaryAllowRdtscFallback|TRUE

  # ImageLoader settings
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRtRelocAllowTargetMismatch|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderHashProhibitOverlap|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderLoadHeader|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderDebugSupport|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderAllowMisalignedOffset|FALSE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRemoveXForWX|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderWXorX|TRUE
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderAlignmentPolicy|0xFFFFFFFF
  gEfiMdePkgTokenSpaceGuid.PcdImageLoaderRelocTypePolicy|0xFFFFFFFF
  gEfiMdePkgTokenSpaceGuid.PcdImageProtectionPolicy|0x00000003

[PcdsPatchableInModule]
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterAccessWidth|8
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialUseMmio|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialUseHardwareFlowControl|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialDetectCable|FALSE
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterBase|0x03F8
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialBaudRate|115200
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialLineControl|0x03
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialFifoControl|0x07
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialClockRate|1843200
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialPciDeviceInfo|{0xFF,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialExtendedTxFifoSize|64
  gEfiMdeModulePkgTokenSpaceGuid.PcdSerialRegisterStride|1
  #
  # Network Pcds
  #
  !include NetworkPkg/NetworkPcds.dsc.inc

[BuildOptions]
  # While there are no PCDs as of now, there at least are some custom macros.
  DEFINE OCPKG_BUILD_OPTIONS_GEN = -D DISABLE_NEW_DEPRECATED_INTERFACES $(OCPKG_BUILD_OPTIONS) -D OC_TARGET_$(TARGET)=1
  DEFINE OCPKG_ANAL_OPTIONS_GEN = "-DANALYZER_UNREACHABLE=__builtin_unreachable" "-DANALYZER_NORETURN=__attribute__((noreturn))"

  GCC:DEBUG_*_*_CC_FLAGS        = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  GCC:NOOPT_*_*_CC_FLAGS        = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  GCC:RELEASE_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -Wuninitialized
  CLANGPDB:DEBUG_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGPDB:NOOPT_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGPDB:RELEASE_*_*_CC_FLAGS = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:DEBUG_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:NOOPT_*_*_CC_FLAGS   = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  CLANGGCC:RELEASE_*_*_CC_FLAGS = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -mstack-protector-guard=global -ftrivial-auto-var-init=pattern
  MSFT:DEBUG_*_*_CC_FLAGS       = $(OCPKG_BUILD_OPTIONS_GEN) /wd4723 /GS /kernel
  MSFT:NOOPT_*_*_CC_FLAGS       = $(OCPKG_BUILD_OPTIONS_GEN) /wd4723 /GS /kernel
  MSFT:RELEASE_*_*_CC_FLAGS     = $(OCPKG_BUILD_OPTIONS_GEN) /wd4723 /GS /kernel
  XCODE:DEBUG_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -ftrivial-auto-var-init=pattern
  XCODE:NOOPT_*_*_CC_FLAGS      = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -fstack-protector-strong -ftrivial-auto-var-init=pattern
  XCODE:RELEASE_*_*_CC_FLAGS    = $(OCPKG_BUILD_OPTIONS_GEN) $(OCPKG_ANAL_OPTIONS_GEN) -Oz -flto -fstack-protector-strong -ftrivial-auto-var-init=pattern

  !include NetworkPkg/NetworkBuildOptions.dsc.inc
