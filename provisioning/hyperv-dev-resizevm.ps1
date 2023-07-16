$VMNAME = "devbox5"
$VHDPATH = "d:\Virtual hard disks\$VMNAME.vhdx"
Resize-VHD -Path $VHDPATH -SizeBytes 200GB
