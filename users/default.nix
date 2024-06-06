{ lib, config, ... }:

{
  imports = [
    ./faculty.nix
    ./student.nix
  ];

  config = { };
}
