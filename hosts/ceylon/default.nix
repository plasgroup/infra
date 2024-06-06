{ inputs, outputs, ... }:

{
  imports = [
    # TODO
    # goal: import modules from flake inputs defined in `./flake.nix`
    # and self-defined modules from flake outputs defined in `./parts/nixos-modules.nix`
    # without infinit recursions
    inputs.noshell.nixosModules.default
    outputs.nixosModules.user
  ];
  networking.hostName = "ceylon";
}
