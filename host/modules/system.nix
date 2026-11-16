{ pkgs, settings, ... }:

{
  services.displayManager.enable = false;
  services.getty.autologinUser = settings.USERNAME;

  console = {
    packages = [ pkgs.terminus_font ];
    font = "ter-v22n";
    keyMap = "fr";
  };

  programs.zsh.enable = true;
  users.users.${settings.USERNAME}.shell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    nano
    vim

    git

    btop
    htop

    dig
    iputils
    nettools
    nmap

    usbutils

    unzip
  ];
}
