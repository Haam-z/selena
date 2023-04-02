{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.sound;
in {
  options.selena.system.services.sound = {
    enable = mkEnableOption "enable my configuration of sound";
  };
  config = mkIf cfg.enable {
    services.pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      jack.enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
