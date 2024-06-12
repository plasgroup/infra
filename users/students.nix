let
  extraGroups = [ "wheel" "student" ];
in
{
  /*
    <username> = {                       # username, no naming convention enforced
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      uid = 2000;                        # id: student uid range [2000, 3000)
      description = "Full Name";         # full name, first + last
      hashedPassword = "$...";           # hash your password with `nix run nixpkgs#mkpasswd -- --method=sha-512`
      home = "/home/<username>";         # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */

  ysun = {
    allowedHosts = [ "all" ];
    uid = 2000;
    description = "Yifei Sun";
    hashedPassword = "$6$Kc2LTjKznVxi4fra$tnDh5PpOiWNYzJSo479KWOuzgJR/nrrlN.Optyb5KFBaJfVbQC.7RYkYI.8BXKEvvIDbHYP70EdMho2GIqDbW/";
    home = "/home/ysun";
    inherit extraGroups;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ47Qtg6qSenUh6Whg3ZIpIhdZZdqdG+L1z2f9UnB+Mw"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVZ9mzYNxccuh3uQR7Hly4KjhbRh4s6UlGQe2GjMtIC"
    ];
  };
}
