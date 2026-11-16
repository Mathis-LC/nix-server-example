{
  STATE_VERSION = "26.05";
  SYSTEM = "x86_64-linux";

  USERNAME = "user";
  USER_PASSWORD = "mysupersecurepassword";

  SSH_PORT = 1234;
  SSH_PUBLIC_KEY = "";

  TIMEZONE = "Europe/Paris";

  ROUTER_IP = "192.168.200.254";
  STATIC_IP = "192.168.200.200";

  # GENERATE_WITH: sudo nix-store --generate-binary-cache-key example /etc/nix/signing-key /etc/nix/signing-key.pub
  TRUSTED_PUBLIC_KEYS = [ "YOUR_MACHINE_KEY_HERE" ];
}