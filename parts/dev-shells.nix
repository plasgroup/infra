{
  perSystem = { unstable, ... }: {
    devShells.default = unstable.mkShell {
      packages = with unstable; [
        direnv
        git
        nix-direnv
      ];
    };
  };
}
