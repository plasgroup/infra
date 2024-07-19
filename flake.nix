{
  outputs = { self, ... } @ inputs: inputs.autopilot.lib.mkFlake
    {
      inherit inputs;

      autopilot = {
        lib = {
          path = ./lib;
          excludes = [ ];
          extender = inputs.nixpkgs.lib;
          extensions = with inputs; [ autopilot.lib hm.lib parts.lib utils.lib ];
        };

        nixpkgs = {
          config = { allowUnfree = true; allowUnfreePredicate = (_: true); };
          overlays = [ ];
          instances = [
            { name = "pkgs"; value = inputs.nixpkgs; }
            { name = "unstable"; value = inputs.unstable; }
          ];
        };

        parts = { path = ./parts; excludes = [ ]; };
      };
    }
    { systems = import inputs.systems; };

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/release-24.05";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # a
    autopilot.url = "github:stepbrobd/autopilot";
    autopilot.inputs.nixpkgs.follows = "nixpkgs";
    autopilot.inputs.parts.follows = "parts";
    autopilot.inputs.systems.follows = "systems";
    # c
    compat.url = "github:edolstra/flake-compat";
    compat.flake = false;
    crane.url = "github:ipetkov/crane";
    crane.inputs.nixpkgs.follows = "nixpkgs";
    # d
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    # g
    gitignore.url = "github:hercules-ci/gitignore.nix";
    gitignore.inputs.nixpkgs.follows = "nixpkgs";
    # h
    hm.url = "github:nix-community/home-manager";
    hm.inputs.nixpkgs.follows = "nixpkgs";
    # i
    impermanence.url = "github:nix-community/impermanence";
    index.url = "github:nix-community/nix-index-database";
    index.inputs.nixpkgs.follows = "nixpkgs";
    # l
    lanzaboote.url = "github:nix-community/lanzaboote/v0.4.1";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.inputs.crane.follows = "crane";
    lanzaboote.inputs.flake-compat.follows = "compat";
    lanzaboote.inputs.flake-parts.follows = "parts";
    lanzaboote.inputs.flake-utils.follows = "utils";
    lanzaboote.inputs.pre-commit-hooks-nix.follows = "pre-commit-hooks";
    lanzaboote.inputs.rust-overlay.follows = "rust-overlay";
    # n
    noshell.url = "github:viperml/noshell";
    noshell.inputs.nixpkgs.follows = "nixpkgs";
    # p
    parts.url = "github:hercules-ci/flake-parts";
    parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
    pre-commit-hooks.inputs.nixpkgs-stable.follows = "nixpkgs";
    pre-commit-hooks.inputs.flake-compat.follows = "compat";
    pre-commit-hooks.inputs.gitignore.follows = "gitignore";
    # r
    rust-overlay.url = "github:oxalica/rust-overlay";
    rust-overlay.inputs.nixpkgs.follows = "nixpkgs";
    # s
    srvos.url = "github:nix-community/srvos";
    srvos.inputs.nixpkgs.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    # u
    utils.url = "github:numtide/flake-utils";
    utils.inputs.systems.follows = "systems";
  };
}
