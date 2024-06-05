args:

let
  inherit (args) inputs outputs;
  inherit (outputs) lib;
in
{
  # x86_64-linux systems
  flake.nixosConfigurations =
    let
      system = "x86_64-linux";
      hosts = [ "assam" "ceylon" "uva" ];
    in
    lib.genAttrs hosts (host: lib.nixosSystem {
      modules = [
        {
          # args managed by `./lib/mk-module-args.nix`
          _module.args = lib.mkModuleArgs {
            inherit system;
            instances = [
              { instance = inputs.nixpkgs; name = "pkgs"; }
              { instance = inputs.unstable; name = "unstable"; }
            ];
            extraArgs = { inherit inputs outputs lib; };
          };
        }
        # system config
        (../hosts/. + "/${host}")
        # platform
        { nixpkgs.hostPlatform = lib.mkDefault system; }
        # state version: follows nixpkgs stable lib version
        { system.stateVersion = lib.mkDefault (lib.versions.majorMinor lib.version); }
      ];
    });
}
