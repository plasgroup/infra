args:

{
  perSystem = { unstable, ... }:
    let pkgs = unstable; in
    {
      formatter = pkgs.nixpkgs-fmt;
    };
}
