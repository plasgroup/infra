let
  extraGroups = [ "student" ];
in
{
  /*
    <username> = {                       # username, first initial + last name
      active = true;                     # user status
      email = "user@example.com";        # where notification emails will be sent to
      uid = 2000;                        # id: student uid range [2000, 3000)
      description = "Full Name";         # full name, first + last
      home = "/home/ysun";               # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */

  ysun = {
    active = true;
    email = "ysun@hey.com";
    uid = 2000;
    description = "Yifei Sun";
    home = "/home/ysun";
    inherit extraGroups;
    allowedHosts = [ ];
    openssh.authorizedKeys.keys = [ ];
  };
}
