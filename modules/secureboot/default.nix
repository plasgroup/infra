{ lib, unstable, inputs, ... }:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = {
    environment.systemPackages = [ unstable.sbctl ];

    boot.loader.systemd-boot.enable = lib.mkForce false;

    # docs: https://github.com/nix-community/lanzaboote
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
