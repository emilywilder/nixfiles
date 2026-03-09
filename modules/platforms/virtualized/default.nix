{
  config,
  lib,
  inputs,
  ...
}:
{
  # Allow vscode to connect to VM/container
  programs.nix-ld.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = config.my.openssh.ports;
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ config.my.username ];
      PermitRootLogin = "no";
    };
  };

}
