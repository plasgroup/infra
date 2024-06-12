{ inputs, ... }:

{
  imports = [
    inputs.index.nixosModules.nix-index

    ./i18n.nix
    ./nix.nix
    ./nixpkgs.nix
  ];
}
