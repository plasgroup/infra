args:

let
  # base
  inherit (args.inputs) nixpkgs;
  inherit (nixpkgs) lib;

  # extensions
  inherit (args.inputs) hm parts utils;
in
# understanding of fixpoint is needed here
  # https://github.com/nixos/nixpkgs/blob/master/lib/fixed-points.nix
  # `final` needs to be passed to all imported files inside this folder
lib.extend (final: prev: lib.mergeAttrsList [
  # extensions
  hm.lib
  parts.lib
  utils.lib

  # imports
  # TODO: automatic import and filename transformation
  {
    filesIn = import ./files-in.nix final;
    mkModuleArgs = import ./mk-module-args.nix final;
  }
])
