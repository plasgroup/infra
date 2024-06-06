args:

{
  perSystem = { unstable, ... }:
    let pkgs = unstable; in
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          direnv
          git
          nix-direnv
        ];
      };
    };
}
