{ inputs, ... }:

{
  imports = with inputs; [
    ./hardware.nix
    ./network.nix

    self.nixosModules.common
    self.nixosModules.disko
    self.nixosModules.nfs-client
    self.nixosModules.packages
    self.nixosModules.secureboot
    self.nixosModules.time
    self.nixosModules.users
  ];

  disko.rootDisk = "/dev/nvme0n1";
  networking = {
    hostName = "ceylon";
    hostId = "67d74868"; # head -c4 /dev/urandom | od -A none -t x4
  };
}
