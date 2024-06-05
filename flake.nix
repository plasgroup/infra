{
  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # c
    compat.url = "github:edolstra/flake-compat";
    compat.flake = false;
    # h
    hm.url = "github:nix-community/home-manager";
    hm.inputs.nixpkgs.follows = "nixpkgs";
    # p
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    # s
    systems.url = "github:nix-systems/default";
    # u
    utils.url = "github:numtide/flake-utils";
    utils.inputs.systems.follows = "systems";
  };

  outputs = { self, ... } @ inputs:
    let inherit (self) outputs; in
    inputs.parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs = { inherit outputs; };
      }
      {
        systems = import inputs.systems;
        imports = [ ./parts ];
      };
}
