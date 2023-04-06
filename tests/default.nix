import <nixpkgs/nixos/tests/make-test-python.nix> {
  name = "selean-test";
  nodes.machine = { config, pkgs, ... }: {
    imports = [ ../modules/default.nix ];
    selena = {
      application.graphical.editors.enable = true;
      system = {
        root = {
          boot-loader.enable = true;
          file-system.enable = true;
          kernel.enable = true;
        };
        services = {
          bluetooth.enable = true;
          inputs.enable = true;
          networking.enable = true;
          package-mangement.enable = true;
          sound.enable = true;
          video.enable = true;
          virtulations.enable = true;
          printing.enable = true;
        };
        system-packages = { fonts.enable = true; };
      };
    };
  };
  testScript = ''
    machine.start()
    machine.wait_for_unit("default.target")
    result = machine.succeed("uname -a")
    print(result)
    if not "Linux" in result:
        raise Exception("Wrong OS")
    print("PASSED")
  '';
}
