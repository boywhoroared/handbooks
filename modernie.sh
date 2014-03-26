# Download modern.ie VMs
# Use unrar to extract ()

# IE6.WinXP
curl -O -L "http://www.modern.ie/vmdownload?platform=linux&virtPlatform=virtualbox&browserOS=IE6-WinXP&parts=1&filename=VirtualBox/IE6_WinXP/Linux/IE6.WinXP.For.LinuxVirtualBox.sfx"
# IE8.WinXP
curl -O -L "http://www.modern.ie/vmdownload?platform=linux&virtPlatform=virtualbox&browserOS=IE8-WinXP&parts=2&filename=VirtualBox/IE8_WinXP/Linux/IE8.WinXP.For.LinuxVirtualBox.part{1.sfx,2.rar}"
# IE10.Win7
curl -O -L "http://www.modern.ie/vmdownload?platform=linux&virtPlatform=virtualbox&browserOS=IE10-Win7&parts=4&filename=VirtualBox/IE10_Win7/Linux/IE10.Win7.For.LinuxVirtualBox.part{1.sfx,2.rar,3.rar,4.rar}"

# Extracting
# unrar e -or <path-to-sfx>


# The `.ova` files are actually `tar` containers. You can extract the 
# virtual machine disk images from these for use with virt-manager/qemu/qcow
# Example:
#  
#  $ file "IE6 - WinXP.ova"
#  IE6 - WinXP.ova: POSIX tar archive (GNU)

