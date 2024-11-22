#include <Uefi.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Library/DebugLib.h>

EFI_STATUS
EFIAPI
OcOzLibsEntryPoint(
    IN EFI_HANDLE        ImageHandle,
    IN EFI_SYSTEM_TABLE  *SystemTable
)
{
    DEBUG((DEBUG_INFO, "OcOzLibs loaded successfully.\n"));

    return EFI_SUCCESS;
}
