{ settings, ... }:

{
  networking.firewall.enable = true;

  networking.firewall.allowedTCPPorts = [ settings.SSH_PORT ];
  networking.firewall.allowedUDPPorts = [  ];
}
