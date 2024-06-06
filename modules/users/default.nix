{ inputs, outputs, ... }:

let lib = outputs.lib; in
{
  imports = [
    inputs.noshell.nixosModules.default
  ];
}
