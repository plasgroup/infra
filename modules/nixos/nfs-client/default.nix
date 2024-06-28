{ pkgs, ... }:

let
  # https://github.com/tum-dse/doctor-cluster-config/blob/master/modules/nfs/client.nix
  mkNfsMounter = nfsUrl: mountpoint: {
    description = "Mount ${mountpoint}";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "nfs-mount-wrapper" ''
        mountcmd="${pkgs.util-linux}/bin/mount -t nfs -o nofail,timeo=14 ${nfsUrl} ${mountpoint}"
        restartsec="5"

        mkdir -p ${mountpoint}
        for i in {1..10}; do
          echo "Mounting nfs. Attempt $i/10"
          echo "> $mountcmd"
          $mountcmd
          ret=$?
          if [[ $ret == 0 ]]; then
            exit 0
          else
            echo "Mounting nfs failed. Retrying in $restartsec sec"
            sleep $restartsec
          fi
        done
        exit $ret
      '';
      ExecStop = "${pkgs.util-linux}/bin/umount ${mountpoint}";
      Restart = "on-failure";
      RestartSec = 10;
    };
  };
in
{
  config = {
    networking.extraHosts = ''
      133.11.234.36 nfs
    '';

    boot.supportedFilesystems = [ "nfs" ];

    systemd.services.nfs-home = mkNfsMounter "nfs:/tank/login-server/home" "/home";
  };
}
