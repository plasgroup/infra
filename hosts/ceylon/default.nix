{ inputs, outputs, ... }:

{
  imports = [
    outputs.nixosModules.users
  ];

  networking.hostName = "ceylon";
}
