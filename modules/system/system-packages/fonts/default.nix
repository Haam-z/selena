{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.system-packages.fonts;
in {
  options.selena.system.system-packages.fonts = {
    enable = mkEnableOption "install my fonts";
  };
  config = mkIf cfg.enable {
    fonts = {
      fontconfig.enable = true;
      fontDir.enable = true;
      enableGhostscriptFonts = true;
      #fonts = [ pkgs.haamfonts ];
    };
  };
}
