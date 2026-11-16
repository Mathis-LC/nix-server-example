{ lib, settings, ... }:

{
  networking.hostName = "nix-server-example";

  # Set your DNS server
  networking.nameservers = [ "192.168.200.253" ];

  networking.wireless.enable = false;

  # Lock ip address
  networking.defaultGateway = {
    address = settings.ROUTER_IP;
    interface = "eth0";
  };

  # Disable dynamic IP assignment
  networking.useDHCP = lib.mkForce false;
  networking.interfaces.eth0 = {
    useDHCP = lib.mkForce false;

    ipv4.addresses = [
      {
        address = settings.STATIC_IP;
        prefixLength = 24;
      }
    ];
  };
}
