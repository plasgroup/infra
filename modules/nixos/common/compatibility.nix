{ ... }:

{
  services.envfs.enable = true; # Useful to execute shebangs on NixOS that assume hard coded locations in locations like /bin or /usr/bin

  programs.nix-ld = { # Necessary on vscode remote host and to run binaries that uses shared libraries.
    enable = true;
  };
}

