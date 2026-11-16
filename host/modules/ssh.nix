{ settings, ... }:

{
  services.openssh = {
    enable = true;
    ports = [ settings.SSH_PORT ];
    settings = {
      KbdInteractiveAuthentication = false;
      PasswordAuthentication = false;
    };
  };

  programs.ssh.startAgent = true;
}
