{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.networking;
in {
  options.selena.system.services.networking = {
    enable = mkEnableOption "enable my configuration of NetworkManager";
  };
  config = mkIf cfg.enable {
    networking = {
      networkmanager.enable = true;
      nameservers = [ "1.1.1.3" "1.0.0.3" ];
      networkmanager.dns = "none";
    };
  };
}
