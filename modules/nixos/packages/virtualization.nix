{ pkgs, ... }:

{
  # we use podman here
  virtualisation.docker.enable = false;

  # common configs
  virtualisation.containers.enable = true;

  virtualisation.podman = {
    enable = true;

    # create a `docker` alias for podman, to use it as a drop-in replacement
    dockerCompat = true;

    # required for containers under podman-compose to be able to talk to each other.
    defaultNetwork.settings.dns_enabled = true;
  };

  # https://github.com/nixos/nixpkgs/issues/226365
  networking.firewall.interfaces."podman*".allowedUDPPorts = [ 53 5353 ];

  # https://wiki.nixos.org/wiki/Podman
  virtualisation.oci-containers.backend = "podman";

  environment.systemPackages = with pkgs; [
    dive # look into docker image layers
    podman-tui # status of containers in the terminal
    podman-compose # start group of containers for dev
  ];
}
