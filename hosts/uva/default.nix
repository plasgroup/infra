{ inputs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.common
    outputs.nixosModules.disko
    outputs.nixosModules.packages
    outputs.nixosModules.users
  ];

  disko.rootDisk = "/dev/nvme0n1";
  networking = {
    hostName = "uva";
    hostId = "0b015f62"; # head -c4 /dev/urandom | od -A none -t x4
  };
}
