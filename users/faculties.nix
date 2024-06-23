let
  extraGroups = [ "wheel" "faculty" ];
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
}
