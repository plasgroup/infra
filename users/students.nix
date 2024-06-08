let
  extraGroups = [ "student" ];
in
{
  /*
    <username> = {                       # username, no naming convention enforced
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      uid = 2000;                        # id: student uid range [2000, 3000)
      description = "Full Name";         # full name, first + last
      home = "/home/<username>";         # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */

  ysun = {
    allowedHosts = [ "all" ];
    uid = 2000;
    description = "Yifei Sun";
    home = "/home/ysun";
    inherit extraGroups;
    openssh.authorizedKeys.keys = [ ];
  };
}
