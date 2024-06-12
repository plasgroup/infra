{
  # eval error:
  # "Your system configures nixpkgs with an externally created instance."
  # "`nixpkgs.config` options should be passed when creating the instance instead."
  # `pkgs`, and other nixpkgs instances' config managed by `./lib/nixpkgs-config.nix`
  # nixpkgs.config = {
  #   allowUnfree = true;
  #   allowUnfreePredicate = (_: true);
  # };
}
