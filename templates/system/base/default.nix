{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system;
in {
  options.selena.system = { };
  config = mkIf cfg.enable { };
}
