# Install and enables Tailscale, user must run:
#   tailscale up
# Once to authenticate.
{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    tailscale
  ];

  services.tailscale.enable = true;

  # Fix some Tailscale routing problems
  networking.firewall.checkReversePath = "loose";
}
