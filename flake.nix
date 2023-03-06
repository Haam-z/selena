{
  description = "too dumb to make a local nixos modules create a flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, hyprland, hardware, ... }@inputs: {
    nixosModules.selena = import ./default.nix;
    nixosModules.default = self.nixosModules.selena;
  };
}
