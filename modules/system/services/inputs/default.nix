{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.inputs;
in {
  options.selena.system.services.inputs = {
    enable = mkEnableOption "enable my input configuration";
  };
  config = mkIf cfg.enable {
    i18n.defaultLocale = "en_US.UTF-8";
    time.timeZone = "Africa/Tunis";
    services.xserver = {
      layout = "us";
      libinput = {
        enable = true;
        touchpad = {
          tapping = true;
          scrollMethod = "twofinger";
          naturalScrolling = true;
          middleEmulation = true;
          clickMethod = "clickfinger";
        };
      };
    };
  };
}
