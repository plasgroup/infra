{ lib, inputs, ... }:

let
  config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
in
{
  # x86_64-linux systems
  flake.nixosConfigurations =
    let
      system = "x86_64-linux";
      hosts = [ "assam" "ceylon" "uva" ];
    in
    lib.genAttrs hosts (host: lib.nixosSystem {
      # args managed by `./lib/mk-module-args.nix`
      # do not set `pkgs` like in `./parts/default.nix`
      # with `_module.args`, some options might refer to a nonexistent package
      # also, do not set other additional module arguments with `_module.args`
      # to prevent infinite recursion
      pkgs = import inputs.nixpkgs { inherit config system; };
      specialArgs = lib.mkModuleArgs {
        inherit config system;
        instances = [{ instance = inputs.unstable; name = "unstable"; }];
        extraArgs = { inherit lib inputs; };
      };

      modules = [
        # system config
        (../hosts/. + "/${host}")
        # platform
        { nixpkgs.hostPlatform = lib.mkDefault system; }
        # state version: follows nixpkgs stable lib version
        { system.stateVersion = lib.mkDefault (lib.versions.majorMinor lib.version); }
      ];
    });
}
