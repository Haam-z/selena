{ lib, config, pkgs, ... }:

let cfg = config.selena.boot;
in {
  options.selena.boot = { enable = lib.mkEnableOption "Selena Example"; };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      cleanTmpDir = false;
      loader.grub = {
        enable = true;
        devices = [ "nodev" ];
        efiInstallAsRemovable = true;
        efiSupport = true;
        extraEntries =
          ''menuentry "Reboot" {reboot} menuentry "Poweroff" {halt} '';

      };
    };
  };
}
