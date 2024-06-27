{
  # currently only supports gnome, we might add KDE or other DE support in the future
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
