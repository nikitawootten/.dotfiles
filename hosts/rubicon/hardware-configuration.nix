# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.resumeDevice = "/dev/disk/by-uuid/49f0603c-2c6a-4814-9326-fbe92576ce0d";
  boot.kernelParams = [
    "resume_offset=12580864"
  ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/49f0603c-2c6a-4814-9326-fbe92576ce0d";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-3d3b6f40-c496-40b7-b8f8-354a382fce74".device = "/dev/disk/by-uuid/3d3b6f40-c496-40b7-b8f8-354a382fce74";

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/65BF-1861";
      fsType = "vfat";
    };

  swapDevices = [
    {
      device = "/swapfile";
      size = 33792;
    }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp170s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}