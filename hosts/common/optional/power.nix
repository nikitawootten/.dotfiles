{ config, pkgs, ... }: {
  # # Suspend-then-hibernate everywhere
  # services.logind = {
  #   lidSwitch = "suspend-then-hibernate";
  #   lidSwitchExternalPower = "lock";
  #   extraConfig = ''
  #     HandlePowerKey=suspend-then-hibernate
  #     IdleAction=suspend-then-hibernate
  #     IdleActionSec=10m
  #   '';
  # };
  # systemd.sleep.extraConfig = "HibernateDelaySec=2h";
}