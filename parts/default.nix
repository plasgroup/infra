args:

let
  inherit (args) inputs outputs;
  inherit (outputs) lib;
  config = lib.nixpkgsConfig;
in
{
  imports = [
    ./dev-shells.nix
    ./formatter.nix
    ./lib.nix
    ./nixos-configurations.nix
    ./nixos-modules.nix
  ];

  perSystem = { system, ... }: {
    # args managed by `./lib/mk-module-args.nix`
    _module.args = lib.mkModuleArgs {
      inherit system config;
      instances = [
        { instance = inputs.nixpkgs; name = "pkgs"; }
        { instance = inputs.unstable; name = "unstable"; }
      ];
      extraArgs = { inherit inputs outputs lib; };
    };
  };
}
