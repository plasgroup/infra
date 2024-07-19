{ inputs, ... }:

{
  imports = with inputs; [
    self.nixosModules.common
    self.nixosModules.disko
    self.nixosModules.nfs-client
    self.nixosModules.packages
    self.nixosModules.time
    self.nixosModules.users
  ];

  disko.rootDisk = "/dev/nvme0n1";
  networking = {
    hostName = "assam";
    hostId = "7c1e75a7"; # head -c4 /dev/urandom | od -A none -t x4
  };
}
