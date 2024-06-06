args: # { withSystem, importApply, ... } args

let
  inherit (args.outputs) lib;
in
{
  flake.nixosModules =
    lib.genAttrs
      (lib.filesIn ../modules)
      (module: {
        # TODO
        # the issue is probably here
        # take a look at flake parts docs: https://flake.parts/define-module-in-separate-file#factor-it-out
        # already tried `importApply`
      });
}
