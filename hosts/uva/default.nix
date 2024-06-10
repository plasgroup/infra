{ inputs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.common
    outputs.nixosModules.users
  ];

  networking.hostName = "uva";
}
