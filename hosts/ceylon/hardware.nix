{
  boot.kernelModules = [ "kvm-intel" ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "thunderbolt"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
}
