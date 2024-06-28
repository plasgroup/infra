{ lib, config, options, inputs, ... }:

{
  imports = [ inputs.disko.nixosModules.disko ];

  # relevant: https://github.com/tum-dse/doctor-cluster-config/blob/master/modules/disko-zfs.nix
  options = {
    disko.rootDisk = lib.mkOption {
      type = lib.types.str;
      default = "/dev/nvme0n1";
      description = "The device to use for the disk";
    };
  };

  config = {
    # bootloader
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };

    # set this to true when installing a new machine
    # and revert to `false` after installation
    boot.loader.efi.canTouchEfiVariables = true;

    # zfs
    boot.supportedFilesystems.zfs = true;
    boot.kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    services.zfs = {
      # do we need replication?
      # autoReplication = true;
      # scrub all pools
      autoScrub.enable = true;
      # snapshots
      autoSnapshot.enable = true;
      # trim all pools
      trim.enable = true;
    };


    # disk
    disko.devices = {
      disk.${lib.removePrefix "/dev/" config.disko.rootDisk} = {
        type = "disk";
        device = config.disko.rootDisk;
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              label = "ESP";
              type = "ef00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            ROOT = {
              label = "ROOT";
              type = "8300";
              size = "100%";
              content = {
                type = "zfs";
                pool = "local";
              };
            };
          };
        };
      };

      # zfs
      zpool.local = {
        type = "zpool";
        options = {
          ashift = "12";
          autotrim = "on";
        };
        rootFsOptions = {
          atime = "off";
          compression = "lz4";
          xattr = "sa";
          mountpoint = "none";
          canmount = "off";
          acltype = "posixacl";
          normalization = "formD";
          "com.sun:auto-snapshot" = "false";
        };
        datasets = {
          root = {
            type = "zfs_fs";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
