{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.home;
in {
  options.selena.home = { };
  config = mkIf cfg.enable { };
}
