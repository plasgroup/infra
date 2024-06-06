let
  extraGroups = [ "faculty" ];
in
{
  /*
    <username> = {                       # username, first initial + last name
      active = true;                     # user status
      email = "user@example.com";        # where notification emails will be sent to
      uid = 1000;                        # id: faculty uid range [1000, 2000)
      description = "Full Name";         # full name, first + last
      home = "/home/<username>";               # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */
}
