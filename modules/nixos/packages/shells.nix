{ pkgs, ... }:

{
  # noshell is enabled in `modules/users/default.nix`
  # docs: https://github.com/viperml/noshell
  environment.systemPackages = with pkgs; [
    bashInteractive
    fish
    nushell
    zsh
  ];
}
