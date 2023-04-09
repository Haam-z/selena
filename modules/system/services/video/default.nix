{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.video;
in
{
  options.selena.system.services.video = {
    enable = mkEnableOption "enable my configuration of video";
  };
  config = mkIf cfg.enable {
    services.xserver.videoDrivers = [ "intel" ];
    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;
  };
}
