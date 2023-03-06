{ lib, config, ... }:

let cfg = config.selena.example;
in {
  options.selena.example = { enable = lib.mkEnableOption "Selena Example"; };

  config = lib.mkIf cfg.enable {
    environment.variables = { SELENA_EXAMPLE = "enabled"; };
  };
}
