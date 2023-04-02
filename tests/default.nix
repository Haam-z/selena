import <nixpkgs/nixos/tests/make-test-python.nix> {
  name = "selean-test";
  nodes.machine = { config, pkgs, ... }: {
    imports = [ ../modules/default.nix ];
    selena = { system.root.boot-loader.enable = true; };
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
