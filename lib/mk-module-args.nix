{ lib }:

{ instances # a list of attrsets
  # [ { instance = args.inputs.nixpkgs;  name = "pkgs"; }
  #   { instance = args.inputs.unstable; name = "unstable"; } ]
, system # host system that will be inherited to instantiate nixpkgs
, config ? { } # nixpkgs config
, overlays ? [ ] # nixpkgs overlays
, extraArgs ? { } # extra args that will be shallow merged to the final attrset
}:

(lib.listToAttrs (builtins.map
  (attr: {
    inherit (attr) name;
    value = (lib.mkDefault (import attr.instance { inherit system config overlays; })).content;
  })
  instances
)) // extraArgs
