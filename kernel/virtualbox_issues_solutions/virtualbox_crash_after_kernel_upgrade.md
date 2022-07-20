# Kernel Upgrade related issues with Virtualbox

![Screenshot](virtualbox_kernel_driver_not_installed.png)

```bash
sudo apt install --reinstall virtualbox-dkms && sudo apt install libelf-dev
sudo /sbin/vboxconfig
sudo modprobe vboxdrv
```


