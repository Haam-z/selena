{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena;
in {
  options.selena = { };
  config = mkIf cfg.enable { };
}
