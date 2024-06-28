{ lib, pkgs, inputs, ... }:

{
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  config = {
    environment.systemPackages = [ pkgs.sbctl ];

    boot.loader.grub.enable = lib.mkForce false;
    boot.loader.systemd-boot.enable = lib.mkForce false;

    # docs: https://github.com/nix-community/lanzaboote
    boot.bootspec.enable = true;
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
