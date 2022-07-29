$vmname = "devbox3"
$vmpath = "C:\ProgramData\Microsoft\Windows\Hyper-V\"+$vmname
$diskpath = "D:\Virtual hard disks\"+$vmname+".vhdx"
remove-vm $vmname
rm $diskpath