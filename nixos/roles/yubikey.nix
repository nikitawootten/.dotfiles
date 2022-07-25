{ config, pkgs, ...}:
let
  username = import ../users/username.nix;
in {
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    gnupg
    yubikey-personalization
  ];

  services.udev.packages = with pkgs; [
    yubikey-personalization
  ];

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  programs.ssh.startAgent = false;

  home-manager.users.${username} = {

  };
}
