{ unstable, inputs, ... }:

{
  imports = [
    inputs.srvos.nixosModules.mixins-tracing

    ./shells.nix
  ];

  config = {
    environment.systemPackages = with unstable; [
      binutils
      btop
      clang
      coq
      edac-utils
      emacs
      ethtool
      file
      fzf
      gcc
      git
      go
      home-manager
      htop
      iotop
      iperf
      ipmitool
      jq
      libarchive
      lsof
      man-pages
      mtr
      nano
      neovim
      netcat
      nvme-cli
      openssl
      pciutils
      psmisc
      python3
      ripgrep
      rsync
      ruby
      sipcalc
      smartmontools
      tcpdump
      usbutils
      vim
      wget
      whois
      zulu
    ];
  };
}
