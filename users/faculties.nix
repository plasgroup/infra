let
  extraGroups = [ "wheel" "faculty" ];
in
{
ugawa = {
    allowedHosts = [ "all" ];
    uid = 1001;
    description = "Tomoharu Ugawa";
    hashedPassword = "$y$j9T$y3Sihu5luKCvYN2xTmqZZ1$bcBvAG38StMWjFLbnXRuydFCq6g.hgy5tOMoIf9C166";
    home = "/home/ugawa";
    inherit extraGroups;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+u/OytXbYyp2H7ByNQ4VRJdRe5WjA/e/AAkUBXlLKt8iHABo9BpIIAE+3+eUwu7Jcy5hCzul/6tezNCoE5uss2zHJ2Nr8PZQOSK9ipBfzwQWUjRW0w/JT0R3QXOAg6kWqrT7cwKJ5JKj0alKdgg9DkaQOZyiD2guRzZyVAnY2Qr6t+NCG+L2/phtqYcirV4jN+sSPQchzkgzLlLhXTuvYGd0Qwkj01S7WNI0a1yhB4UW5ujRCOR3g79wrjL1PJbenvxZyS/1Yk9x5HkeMGs16xUM3EAbifmf5UBAlmhjHX+5fsY0ehK+4+SmxjR087gF4ZokLMn8Nm6d7HrWlHhCj"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDExGCbs5BUeacja5RF+/HCC8cCCBZ+Y90G2vrO1m9MjxqZv7uodMl7vuNDXhQ4qXwMGIUE9Yh+SS6Ru67Ak3RvBe5J/cpjKgnqMSYJwXCmEYkplJdoWwRoJ4RXiDUi2uy+J4pb/2H4WPCQN65xIUiTrJpSBp1PXQOrUO/ksGmmQnEVsIASw5xg4cqHFl9kad0juNPUHN3QyAV9ba8gwEt1wIoSUzb3KG2AwDqlcFe4VrDOmFHVp7qkS1WVxXad7vAul0jZOsdPbq1Y2d+0/68xpDnp6grtmJ99nWONSml+WIrKE8ISmAVXq8tNcMABUc5UlnP/L7wX5rniKVzjNc6vSffR2kGW4Kg9r8671AYUmLv+ItBU1q4bSYnDUP6oHsLZxuXkCPtr26YbCwAPe3Ib9bs03P2m3M+LCSdyw6lJV3Fp5QB1zOoai7shRZzjAyaw23Q0GHIX+zJRa1LKUmdu89Rtn493JRy9UuTRgsFiskHcZ44XURlAMioPXEtZ3ME="
    ];
  };
  /*
    <username> = {                       # username, no naming convention enforced
      allowedHosts = [ ];                # a list of hosts where the user is allowed access to, the host name must be one of the names in the `./hosts` directory
      uid = 1000;                        # id: use the matching id from the internal wiki
      description = "Full Name";         # full name, first + last
      hashedPassword = "$...";           # hash your password with `nix run nixpkgs#mkpasswd`
      home = "/home/<username>";         # user's home directory
      extraGroups = [ ];                 # a list of groups where the user belongs to
      openssh.authorizedKeys.keys = [ ]; # ssh keys
    };
  */
}
