{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.virtulations;
in {
  options.selena.system.services.virtulations = {
    enable = mkEnableOption "configure my virtulation setup";
  };
  config = mkIf cfg.enable {
    virtualisation = {
      docker = { enable = true; };
      libvirtd = { enable = true; };
    };
  };
}
