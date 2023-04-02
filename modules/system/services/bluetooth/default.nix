{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.bluetooth;
in {
  options.selena.system.services.bluetooth = {
    enable = mkEnableOption "enable my configuration of bluetooth";
  };
  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
      powerOnBoot = true;
    };
  };
}
