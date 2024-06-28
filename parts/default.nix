args:

let
  inherit (args) inputs outputs;
in
{
  # automatic import, but must exclude `default.nix` and `lib.nix` to prevent infinite recursion
  imports = [ ./lib.nix ] ++ (
    let
      inherit (inputs.nixpkgs) lib;
    in
    # the `lib` here is from nixpkgs
    builtins.map (f: ./. + "/${f}") (lib.filter
      (f: !(f == "default.nix" || f == "lib.nix"))
      (lib.attrNames (builtins.readDir ./.)))
  );

  perSystem = { system, ... }:
    let
      # the `lib` here is exported `./lib`
      inherit (outputs) lib;
      config = lib.nixpkgsConfig;
    in
    {
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
