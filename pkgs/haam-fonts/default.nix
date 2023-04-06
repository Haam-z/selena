{ lib, stdenv, fetchzip, }:
stdenv.mkDerivation rec {
  pname = "haam-fonts";
  version = "1.0";

  src = fetchzip {
    url =
      "https://github.com/Haam-z/fonts/archive/89eca28ef2805077299819140a28e0409444052d.zip";
    sha256 = "sha256-nzb6ZJoi48DMwIN4L8XTn+7KuZ3TDoTOZ1VvZz5Rq38=";
  };

  dontConfigure = true;
  dontBuild = true;
  doCheck = false;

  installPhase = ''
    mkdir -p $out/share/fonts/otf
    mkdir -p $out/share/fonts/ttf
    install -m444 -Dt $out/share/fonts/ttf ${src}/fonts/ttf/*.ttf;
    install -m444 -Dt $out/share/fonts/otf ${src}/fonts/otf/*.otf;
  '';

  meta = with lib; {
    description = "A collection of fonts so i never install anything else";
    homepage = "https://github.com/Haam-z/fonts";
    license = licenses.unlicense;
  };
}
