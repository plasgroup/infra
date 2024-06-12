{ unstable, ... }:

{
  # noshell is enabled in `modules/users/default.nix`
  # docs: https://github.com/viperml/noshell
  environment.systemPackages = with unstable; [
    bashInteractive
    fish
    nushell
    zsh
  ];
}
