$VMNAME = "devbox5"
$VHDPATH = "d:\Virtual hard disks\$VMNAME.vhdx"
$BOOTVHDPATH = "D:\images\ubuntu-22.04.1-live-server-amd64.iso"
$VM = @{
	Name = $VMName
	MemoryStartupBytes = 12582912000
	Generation = 2
	NewVHDPath = "$VHDPATH"
	NewVHDSizeBytes = 50GB
	SwitchName = "Default Switch"
}
new-vm @vm
Set-VMMemory -VMName $VMNAME -DynamicMemoryEnabled $false
Add-VMDvdDrive -VMName $VMNAME -Path $BOOTVHDPATH
set-VMFirmware -EnableSecureBoot Off -VMName $VMNAME
$drive = Get-VMDvdDrive -VMName $VMName
Set-VMFirmware -VMName $VMNAME -BootOrder $drive
Set-VMProcessor -VMName $VMNAME -Count 10
set-vm $VMNAME -CheckpointType Disabled
Enable-VMIntegrationService -VMName $VMNAME -Name "Guest Service Interface"
#TODO: how to setup ubunutu unattended
