{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.root;
in {
  options.selena.system.root = { enable = mkEnableOption "Template"; };
  config = mkIf cfg.enable { };
}
