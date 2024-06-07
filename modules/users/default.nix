{ inputs, lib, ... }:

{
  imports = [
    inputs.noshell.nixosModules.default
  ];
}
