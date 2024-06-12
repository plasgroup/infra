{ inputs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.common
    outputs.nixosModules.packages
    outputs.nixosModules.users
  ];

  networking.hostName = "uva";
}
