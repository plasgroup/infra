{ moduleWithSystem, ... } @ args:

let
  inherit (args.outputs) lib;
in
{
  flake.nixosModules =
    lib.genAttrs
      (lib.filesIn ../modules)
      (module: moduleWithSystem (
        { inputs, outputs, lib, pkgs, unstable }:
        { imports = [ (import (../modules/. + "/${module}")) ]; }
      ));
}
