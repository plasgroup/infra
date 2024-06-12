{
  # noshell is enabled in `modules/users/default.nix`
  # docs: https://github.com/viperml/noshell
  programs = {
    bash.enable = true;
    fish.enable = true;
    nushell.enable = true;
    zsh.enable = true;
  };
}
