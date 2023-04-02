{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.root.kernel;
in {
  options.selena.system.root.kernel = {
    enable = mkEnableOption "my configuration for the linux kernel";
  };
  config = mkMerge [
    { boot.cleanTmpDir = false; }
    (mkIf cfg.enable { boot.kernelPackages = pkgs.linuxPackages_testing; })
  ];
}
