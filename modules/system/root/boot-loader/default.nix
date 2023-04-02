{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.root.boot-loader;
in {
  options.selena.system.root.boot-loader = {
    enable = mkEnableOption "enable my boot loader";
  };
  config = mkIf cfg.enable {
    boot.loader.grub = {
      enable = true;
      devices = [ "nodev" ];
      efiInstallAsRemovable = true;
      efiSupport = true;
      extraEntries =
        ''menuentry "Reboot" {reboot} menuentry "Poweroff" {halt} '';
    };
  };
}
