# Changelog

## [Unreleased]

### Changed

- The Windows binary is now built by the same compiler as the Linux and macOS
  ones. Size is essentially unchanged (292 KB to 300 KB). Checked on Windows 10:
  `--version`, and running a Makefile recipe.

  It now uses the Universal C Runtime, which is part of Windows 10 and later.
  On Windows 7 or 8.1 that runtime has to be installed first — it comes through
  Windows Update. The previous binary did not need it.
