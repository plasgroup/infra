{ lib, pkgs, ... }:

{
  # currently only supports gnome, we might add KDE or other DE support in the future
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;

    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "full";
      };
    };
  };
}
