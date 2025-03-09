{
  lib,
  stdenv,
  xorgproto,
  libX11,
  libXext,
  libXrandr,
  libxcrypt,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "slock";
  version = "unstable-2025-03-06";

  src = fetchFromGitHub {
    owner = "sevenpkgs";
    repo = "slock";
    rev = "0f7a04f5c08c8b0ad19b98bf8170a3e3b92c5648";
    hash = "sha256-CS1/o+1P46kodeP7a7DmhSZjcY8ZyYEd9LuxR6X8V1k=";
  };

  buildInputs = [
    xorgproto
    libX11
    libXext
    libXrandr
    libxcrypt
  ];

  installFlags = ["PREFIX=$(out)"];

  meta = {
    description = "My fork of suckless' slock";
    homepage = "https://github.com/sevenpkgs/slock";
    license = lib.licenses.mit;
    mainProgram = "slock";
    platforms = lib.platforms.all;
  };
}
