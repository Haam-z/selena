{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.root.file-system;
in {
  options.selena.system.root.file-system = {
    enable = mkEnableOption "support my list of file systems";
  };
  config = mkIf cfg.enable {
    boot.supportedFilesystems = [ "ntfs" ];
    services = { gvfs.enable = true; };
  };
}
