{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.system-packages;
in {
  options.selena.system.system.system-packages = {
    enable = mkEnableOption "Template";
  };
  config = mkIf cfg.enable { };
}
