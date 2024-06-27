{ inputs, outputs, ... }:

{
  imports = [
    ./hardware.nix
    ./network.nix

    outputs.nixosModules.common
    outputs.nixosModules.desktop
    outputs.nixosModules.disko
    outputs.nixosModules.nfs-client
    outputs.nixosModules.packages
    outputs.nixosModules.secureboot
    outputs.nixosModules.time
    outputs.nixosModules.users
  ];

  disko.rootDisk = "/dev/nvme0n1";
  networking = {
    hostName = "ceylon";
    hostId = "67d74868"; # head -c4 /dev/urandom | od -A none -t x4
  };
}
