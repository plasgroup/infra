# Ugawa Lab Nix/NixOS Infra

[![Built with Nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## Structure

- `./hosts`: Host-specific configurations
- `./lib`: Where all helper functions live
- `./modules`: NixOS modules
- `./parts`: All top-level attrs must be exported from files inside `./parts`.
- `./users`: Users and access control

## Users

To add a new user, add an entry to either `./users/faculties.nix` or `./users/students.nix`.

Users are exported to all NixOS hosts via `./modules/users/default.nix`.

Home directories are mounted on a NFS export defined in `./modules/nfs-client/default.nix`.

### Entry Format

```nix
# other configuration options in https://mynixos.com/nixpkgs/options/users.users.%3Cname%3E are also allowed
<username> = {                         # username, no naming convention enforced
    allowedHosts = [ ];                # the host name must `[ "all" ]` or one or more of the names in the `./hosts` directory
    uid = <int>;                       # uid: faculty uid range [1000, 2000), student uid range [2000, 3000)
    description = "Full Name";         # full name, first + last
    hashedPassword = "$...";           # execution result of `nix run nixpkgs#mkpasswd -- --method=sha-512`
    home = "/home/<username>";         # user's home directory, `<username>` must be the same as the key
    extraGroups = [ ];                 # a list of groups where the user belongs to
    openssh.authorizedKeys.keys = [ ]; # ssh keys
};
```

Please note that users and groups are immutable
To update a user, you must change relevant fields in
either `./users/faculties.nix` or `./users/students.nix`,
then rebuild the system.

### Login Shell

Login shells are managed by [`noshell`](https://github.com/viperml/noshell),
you can change the default shell by simply symlinking the desired shell
executable to `~/.config/shell`.

By default, the system provides `bash`, `fish`, `nushell`, and `zsh` (under `./modules/packages/shells.nix`).
You can
link one of them by executing `ln -sT $(which <shell>) ~/.config/shell`.

Or with [`home-manager`](https://github.com/nix-community/home-manager) standalone
installation with `xdg.configFile."shell".source = lib.getExe pkgs.<your shell package>;`
added to the user's configuration.

## Hosts

All hosts are defined in `./hosts` directory, and exported in `./parts/nixos-configurations.nix`.

### Base Configuration

All hosts by default uses ZFS on a disk named `nvme0n1`,
two partitions are created, ESP (FAT) and ROOT (ZFS).

To change the root disk name, change `disko.rootDisk = "/dev/<dev name>";`

ZFS requires host ID to be unique, to change the host ID, change `networking.hostId = <str>;`. The following command can be used to generate a unique host ID: `head -c4 /dev/urandom | od -A none -t x4`.

### Installation

#### (Optional) Secure Boot

If the host BIOS supports Secure Boot, you'll need to disable it first before booting into the NixOS live CD.

- Make sure the host supports Secure Boot on hardware level.
- Disable Secure Boot in the BIOS settings.
- Change BIOS settings to allow writes to BIOS secure boot keys (look for keywords like "PKI Bundle").

Related:

- [NixOS Secure Boot Wiki](https://wiki.nixos.org/wiki/Secure_Boot)
- [Lanzaboote](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)

#### Format and Install

Boot to the NixOS live CD, then run the following command to format the disk (replace `<machine>` with the machine name):

```shell
bash $(nix --extra-experimental-features "nix-command flakes" --refresh build --no-link --print-out-paths github:plasgroup/infra#nixosConfigurations.<machine>.config.system.build.diskoScript)
```

Then execute the following command to install the system:

```shell
nixos-install --no-root-passwd --flake github:plasgroup/infra#<machine>
```

If you used Secure Boot, you'll probably see some errors during the installation process, but you can ignore them here, for now.

(Optional, Secure Boot Only)

```shell
# get the secure boot keys
nix --extra-experimental-features "nix-command flakes" shell nixpkgs#sbctl
sbctl create-keys && mv /etc/secureboot /mnt/etc
# run the installation script again (you probably need to run this twice, if you see any error, just run this again)
nixos-install --no-root-passwd --flake github:plasgroup/infra#<machine>
# reboot into the new system
sbctl verify
```

Reboot into BIOS settings:
  
- Enable Secure Boot.
- Erase all Secure Boot Settings (or look for a similar option to wipe the Secure Boot keys).
- Boot into the new system.

Execute the following command to install Lanzaboote managed secure boot PKI Bundle:

```shell
sbctl enroll-keys --microsoft
```

Reboot and check secure boot status: `bootctl status`.

## License

All contents inside this repository, excluding submodules, are licensed under the [MIT License](license.txt).
Third-party file(s) and/or code(s) are subject to their original term(s) and/or license(s).
