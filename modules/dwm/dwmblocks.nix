{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    (pkgs.stdenv.mkDerivation rec {
      pname = "dwmblocks";
      version = "1.0";

      src = ./dwmblocks;
      nativeBuildInputs = [pkgs.makeWrapper pkgs.xorg.libX11 pkgs.xorg.libX11.dev];
      installPhase = ''
        mkdir -p $out/bin
        cp dwmblocks $out/bin
      '';

      meta = with lib; {
        description = "A status bar for dwm";
        license = licenses.mit;
      };
    })
  ];
}
