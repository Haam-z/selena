{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.printing;
in {
  options.selena.system.services.printing = {
    enable = mkEnableOption "configure nix and flatpack";
  };
  config = mkIf cfg.enable {
    services = {
      printing.enable = true;
      avahi = {
        enable = true;
        nssmdns = true;
        # for a WiFi printer
        openFirewall = true;
      };
    };

  };
}
