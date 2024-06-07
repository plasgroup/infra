{ inputs, outputs, ... }:

{
  imports = [
    inputs.noshell.nixosModules.default
    outputs.nixosModules.users
  ];

  networking.hostName = "ceylon";
}
