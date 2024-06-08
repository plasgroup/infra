lib:

# import all users from `./users`
let
  hosts = lib.filesIn ../hosts;
  users = import ../users;
in
lib.listToAttrs (builtins.map
  (attr: {
    name = attr.name;
    # if "all" is found at all in `allowedHosts`
    # this function will replace the content of
    # the original `allowedHosts` with all the hosts
    # or all listed folders within `./hosts`
    value =
      if lib.elem "all" attr.value.allowedHosts
      then lib.recursiveUpdate attr.value { allowedHosts = hosts; }
      else attr.value;
  })
  (lib.attrsToList users)
)
