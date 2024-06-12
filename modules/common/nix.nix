{ config, lib, inputs, ... }:

{
  nix = {
    # use stable nix
    # package = pkgs.nixVersions.latest;

    # disable gc
    # gc = {
    #   automatic = true;
    #   options = "--delete-older-than 365d";
    # };

    registry = lib.mkForce (lib.mapAttrs (_: value: { flake = value; }) inputs);
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      use-xdg-base-directories = true;
      warn-dirty = false;

      trusted-users = [ "root" "@wheel" ];

      experimental-features = [
        "auto-allocate-uids"
        "ca-derivations"
        "cgroups"
        "flakes"
        "impure-derivations"
        "nix-command"
      ];
    };

    extraOptions = ''
      allow-import-from-derivation = true
      keep-build-log = true
      keep-derivations = true
      keep-env-derivations = true
      keep-failed = true
      keep-going = true
      keep-outputs = true
    '';
  };
}
