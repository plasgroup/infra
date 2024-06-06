args:

let
  inherit (args) inputs outputs;
  inherit (outputs) lib;
in
{
  imports = [
    ./dev-shells.nix
    ./formatter.nix
    ./lib.nix
    ./nixos-configurations.nix
  ];

  perSystem = { system, ... }: {
    # args managed by `./lib/mk-module-args.nix`
    _module.args = lib.mkModuleArgs {
      inherit system;
      instances = [
        { instance = inputs.nixpkgs; name = "pkgs"; }
        { instance = inputs.unstable; name = "unstable"; }
      ];
      extraArgs = { inherit inputs outputs lib; };
    };
  };
}