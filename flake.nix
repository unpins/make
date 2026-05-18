{
  description = "Standalone build of GNU make";

  nixConfig = {
    extra-substituters = [ "https://unpins.cachix.org" ];
    extra-trusted-public-keys = [ "unpins.cachix.org-1:DDaShjbZ8VvcqxeTcAU3kV9vxZQBlyb7V/uLBHfTynI=" ];
  };

  inputs.unpins-lib.url = "github:unpins/nix-lib";

  # nixpkgs ships GNU make as `gnumake` (the binary is `make`); native build
  # bridges the name mismatch here so the consumer-facing repo stays at
  # `unpins/make`.
  outputs = { self, unpins-lib }:
    unpins-lib.lib.mkStandaloneFlake {
      inherit self;
      name = "make";
      build = pkgs: pkgs.pkgsStatic.gnumake;
      # Mingw quirk: src/job.c:378 calls `O (fatal, NILF, error_string)` (a
      # fatal-error macro whose argument is a *runtime* string), which trips
      # -Werror=format-security under mingw cross. Demoting it to a warning
      # lets the build finish — the call site only fires inside Windows-
      # specific batch-file creation, and `error_string` is the output of
      # `map_windows32_error_to_string`, not attacker-controlled input.
      windowsBuild = pkgs:
        let cross = unpins-lib.lib.mingwStaticCross pkgs; in
        cross.gnumake.overrideAttrs (old: {
          env = (old.env or { }) // {
            NIX_CFLAGS_COMPILE = builtins.concatStringsSep " " (
              (pkgs.lib.optional (old ? env && old.env ? NIX_CFLAGS_COMPILE)
                old.env.NIX_CFLAGS_COMPILE)
              ++ [ "-Wno-error=format-security" ]);
          };
        });
    };
}
