{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  pname = "harsh";
  version = "0.10.13";

  src = fetchFromGitHub {
    owner = "wakatara";
    repo = "harsh";
    rev = "v${version}";
    hash = "sha256-DapnCcyzwYc8ighKGD27CYom0x0QjoY9v8kvamlkkzY=";
  };

  vendorHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  ldflags = ["-s" "-w"];

  meta = {
    description = "Habit tracking for geeks. A minimalist, command line tool for tracking and understanding your habits";
    homepage = "https://github.com/wakatara/harsh";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [sevenpkgs];
    mainProgram = "harsh";
  };
}
