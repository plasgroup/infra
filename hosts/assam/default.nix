{ inputs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.common
    outputs.nixosModules.disko
    outputs.nixosModules.nfs-client
    outputs.nixosModules.packages
    outputs.nixosModules.time
    outputs.nixosModules.users
  ];

  disko.rootDisk = "/dev/nvme0n1";
  networking = {
    hostName = "assam";
    hostId = "7c1e75a7"; # head -c4 /dev/urandom | od -A none -t x4
  };
}
