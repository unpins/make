{
  description = "Standalone build of GNU make";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  inputs.unpins-lib.url = "github:unpins/nix-lib";

  # nixpkgs ships GNU make as `gnumake` (the binary is `make`); native build
  # bridges the name mismatch here so the consumer-facing repo stays at
  # `unpins/make`. Windows mingw quirk (one extra -Wno-error=format-security)
  # still lives in `nix-lib/mingw/make.nix`.
  outputs = { self, unpins-lib }:
    unpins-lib.lib.mkStandaloneFlake {
      inherit self;
      name = "make";
      windows = true;
      build = pkgs: pkgs.pkgsStatic.gnumake;
    };
}
