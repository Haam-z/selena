{
  description = "too dumb to make a local nixos modules create a flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: {
    nixosModules.selena = import ./modules/default.nix;
    nixosModules.default = self.nixosModules.selena;
    templates = {
      system = {
        path = ./templates/system/base;
        description = "template for system modules";
      };
      system-root = {
        path = ./templates/system/root;
        description = "template for root modules";
      };
      system-servises = {
        path = ./templates/system/servises;
        description = "template for servises modules";
      };
      system-system-packages = {
        path = ./templates/system/system-packages;
        description = "template for system-packges modules";
      };
      home = {
        path = ./templates/home/base;
        description = "template for home modules";
      };
      projects = {
        path = ./templates/projects/base;
        description = "template for prokects";
      };
      module = {
        path = ./templates/moduel;
        description = "template for selena modules";
      };
    };
    defaultTemplate = self.templates.module;
  };
}
