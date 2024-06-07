args:

let
  inherit (args) inputs outputs;
  inherit (outputs) lib;
  config = lib.nixpkgsConfig;
in
{
  # x86_64-linux systems
  flake.nixosConfigurations =
    let
      system = "x86_64-linux";
      hosts = [ "assam" "ceylon" "uva" ];
    in
    lib.genAttrs hosts (host: lib.nixosSystem {
      pkgs = import inputs.nixpkgs { inherit system config; };

      # args managed by `./lib/mk-module-args.nix`
      specialArgs = lib.mkModuleArgs {
        inherit system config;
        instances = [{ instance = inputs.unstable; name = "unstable"; }];
        extraArgs = { inherit inputs outputs lib; };
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
