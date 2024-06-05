args:

{
  perSystem = { unstable, ... }: {
    formatter = unstable.nixpkgs-fmt;
  };
}
