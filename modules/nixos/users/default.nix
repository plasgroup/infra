{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.noshell.nixosModules.default
  ];

  config = {
    # `noshell` will be enabled for all users
    # https://github.com/viperml/noshell
    # this only manages the login shell
    # users can configure their own login shell without root permission with
    # `xdg.configFile."shell".source = lib.getExe pkgs.zsh;`
    programs.noshell.enable = true;

    # optionally create users based on `lib.users.<name>.allowedHosts`
    users.users = lib.listToAttrs (builtins.map
      (attr: {
        name = attr.name;
        value = {
          inherit (attr.value) description extraGroups hashedPassword home openssh uid;
          isNormalUser = true;
          shell = inputs.noshell.packages.${pkgs.stdenv.system}.default;
        };
      })
      (lib.filter (attr: lib.elem config.networking.hostName attr.value.allowedHosts) (lib.attrsToList lib.users)));
  };
}
