{ lib, pkgs, config, ... }:
with lib;
let cfg = config.selena.system.services.package-mangement;
in {
  options.selena.system.services.package-mangement = {
    enable = mkEnableOption "configure nix and flatpak";
  };
  config = mkIf cfg.enable {
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    services = { flatpak.enable = true; };
    nix = {
      package = pkgs.nixFlakes;
      extraOptions = "experimental-features = nix-command flakes";
      settings.trusted-substituters = [ "http://cache.nixos.org" ];
      settings.substituters = [ "http://cache.nixos.org" ];
      gc.automatic = true;
    };
    nixpkgs.config.allowUnfree = true;
    nixpkgs.system = "x86_64-linux";
  };
}
