let
  extraGroups = [ "wheel" "student" ];
in
{
  /*
    <username> = {                       # username, no naming convention enforced
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      uid = 1000;                        # id: use the matching id from the internal wiki
      description = "Full Name";         # full name, first + last
      hashedPassword = "$...";           # hash your password with `nix run nixpkgs#mkpasswd -- --method=sha-512`
      home = "/home/<username>";         # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */

  yifei = {
    allowedHosts = [ "all" ];
    uid = 1207;
    description = "Yifei Sun";
    hashedPassword = "$6$Kc2LTjKznVxi4fra$tnDh5PpOiWNYzJSo479KWOuzgJR/nrrlN.Optyb5KFBaJfVbQC.7RYkYI.8BXKEvvIDbHYP70EdMho2GIqDbW/";
    home = "/home/yifei";
    inherit extraGroups;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ47Qtg6qSenUh6Whg3ZIpIhdZZdqdG+L1z2f9UnB+Mw"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVZ9mzYNxccuh3uQR7Hly4KjhbRh4s6UlGQe2GjMtIC"
    ];
  };

  ichinose = {
    allowedHosts = [ "all" ];
    uid = 1102;
    description = "Kazuki Ichinose";
    hashedPassword = "$6$3qky8q4NNESPbJW8$tm.uKl4xsJUKHrorTw9myBMaaXjqyJLEQLFi1qunRP/1AtGZyhV3JK0G3J1kCS/aZSKtffcPwYuaZYU5kijFh1";
    home = "/home/ichinose";
    inherit extraGroups;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC8LagJKcgCTZMrfGHTUE4y8B6g/5wgq+ufKHblSH81n"
    ];
  };
}
