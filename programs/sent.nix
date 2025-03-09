{
  lib,
  stdenv,
  fetchFromGitHub,
  farbfeld,
  libX11,
  libXft,
  makeWrapper,
}:
stdenv.mkDerivation {
  pname = "sent";
  version = "unstable-2025-03-03";

  src = fetchFromGitHub {
    owner = "sevenpkgs";
    repo = "sent";
    rev = "9c34e9af849db66b6c0a36db93f48320572f8eb4";
    hash = "sha256-6EwNxXJsO6RQ+utbiF20u/TXhi34gzv5tCUTJxEjNV4=";
  };

  installFlags = ["PREFIX=$(out)"];

  nativeBuildInputs = [makeWrapper];

  buildInputs = [
    libX11
    libXft
  ];
  postInstall = ''
    wrapProgram "$out/bin/sent" --prefix PATH : "${lib.makeBinPath [farbfeld]}"
  '';

  meta = {
    description = "My fork of suckless' sent";
    homepage = "https://github.com/sevenpkgs/sent";
    mainProgram = "sent";
    platforms = lib.platforms.all;
  };
}
