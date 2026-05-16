{
  description = "Standalone build of GNU make";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  inputs.unpins-lib.url = "github:unpins/nix-lib";

  # nixpkgs calls the package `gnumake` (the binary is `make`); the fixes in
  # nix-lib/{native,mingw}/make.nix bridge the name mismatch so the flake
  # output stays under unpins/make for `unpin make`.
  outputs = { self, unpins-lib }:
    unpins-lib.lib.mkStandaloneFlake {
      inherit self;
      name = "make";
      windows = true;
    };
}
