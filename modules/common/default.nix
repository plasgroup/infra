{ inputs, ... }:

{
  imports = [
    inputs.index.nixosModules.nix-index
    inputs.srvos.nixosModules.server
    inputs.srvos.nixosModules.mixins-nix-experimental
    inputs.srvos.nixosModules.mixins-trusted-nix-caches

    ./i18n.nix
    ./nix.nix
    ./nixpkgs.nix
  ];

  config = {
    # use nix-index-database
    programs.command-not-found.enable = false;
  };
}
