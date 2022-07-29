$vmname = "devbox3"
$vmmemory = "8gb"
$cpucount = 8
$vmserver = "localhost"
$vmswtich = "default switch"
$vmpath = "C:\ProgramData\Microsoft\Windows\Hyper-V\"+$vmname
$diskpath = "D:\Virtual hard disks\"+$vmname+".vhdx"
$ubuntuiso = "d:\images\ubuntu-22.04-live-server-amd64.iso"

#write-host $vmpath
New-VM -Name $vmname -MemoryStartupBytes $vmmemory -Generation 2 -switchname $vmswtich
New-VHD -Path $diskpath -SizeBytes 90GB -Dynamic
Add-VMHardDiskDrive -VMName $vmname -Path $diskpath
Set-VMProcessor $vmname -count $cpucount -Reserve 100
#TODO: this doesn't work
Set-VMDvdDrive -VMName $vmname -Path $ubuntuiso
#TODO: how to disable secure boot?
#TODO: how to disable snapshots
#TODO: how to setup ubunutu unattended