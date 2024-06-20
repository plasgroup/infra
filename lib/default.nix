args:

let
  # base
  inherit (args.inputs.nixpkgs) lib;

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

  # automatic import with name transformation
  # implement in a cleaner way?
  (
    let
      # kebabToCamel "abc-def-g" -> "abcDefG"
      kebabToCamel = s: mutFirstChar lib.toLower (lib.concatStrings
        (builtins.map
          (s': mutFirstChar lib.toUpper s')
          (lib.splitString "-" s)));

      # imports all nix files in `dir` with `args`
      # excluding files specified in `exclude`
      # and change the original file names with `transformer`
      loadAll =
        { dir ? ./.
        , transformer ? _: _
        , exclude ? [ ]
        , args ? { }
        }: lib.listToAttrs (builtins.map
          # file name
          (fn: {
            # name transformation (e.g. "mk-module-args" -> "mkModuleArgs")
            name = transformer (lib.removeSuffix ".nix" fn);
            # function import
            value = import (dir + "/${fn}") args;
          })
          (lib.filter (n: !(lib.elem n exclude)) (lib.attrNames (builtins.readDir dir))));

      # mutFirstChar toUpper "abcd" -> "Abcd"
      mutFirstChar = f: s:
        let
          c = lib.stringToCharacters s;
        in
        lib.concatStrings ([ (f (lib.head c)) ] ++ (lib.sublist 1 (lib.length c) c));
    in
    { inherit kebabToCamel loadAll mutFirstChar; } // loadAll {
      dir = ./.;
      transformer = kebabToCamel;
      exclude = [ "default.nix" ];
      args = { lib = final; };
    }
  )
])
