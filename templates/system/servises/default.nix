{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.servises;
in {
  options.selena.system.servises = { enable = mkEnableOption "Template"; };
  config = mkIf cfg.enable { };
}
