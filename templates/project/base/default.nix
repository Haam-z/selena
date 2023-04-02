{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.project;
in {
  options.selena.project = { };
  config = mkIf cfg.enable { };
}
