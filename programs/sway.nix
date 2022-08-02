{ config, pkgs, ... }: {
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = true;
    QT_QPA_PLATFORM = "wayland";
    LIBSEAT_BACKEND = "logind";
  };
  home.packages = with pkgs; [
    wl-clipboard
  ];
  wayland.windowManager.sway = {
    enable = true;
    package = null; # don't override system-installed one
    wrapperFeatures.gtk = true;
    config = {

    };
  };
}