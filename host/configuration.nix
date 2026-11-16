{ modulesPath, settings, ... }:

{
  system.stateVersion = settings.STATE_VERSION;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  hardware.bluetooth.enable = false;

  home-manager.users.${settings.USERNAME} = { pkgs, ... }: {
    home.stateVersion = settings.STATE_VERSION;
    home.packages = [ pkgs.zsh ];

    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
    };
  };

  # You can use trusted keys for deployment to enhance security
  # nix.settings.trusted-public-keys = [ settings.TRUSTED_PUBLIC_KEYS ];
  nix.settings.require-sigs = false;

  nix.settings.trusted-users = [ "root" settings.USERNAME ];

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./hardware-configuration.nix

    ./modules/firewall.nix
    ./modules/locales.nix
    ./modules/network.nix
    ./modules/ssh.nix
    ./modules/system.nix
    ./modules/user.nix

  ];
}
