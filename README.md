# `cargo-bisect-rustc` for `rustc` codegen regressions

This crate shows an example of using `cargo-bisect-rustc` to find a regression in rustc's codegen.
It can be used to check for regressions based off the generated assembly or llvm-ir (or rust MIR/HIR).

## Usage

1. Put the code you want to bench in `src/lib.rs`
2. Tweak `bisect.sh` (in the root directory) where `cargo rustc -- ...` is executed. Modify the options passed to `rustc` as needed.
Make sure that the script returns with a zero exit code for the good case and a non-zero exit code for the regression.
3. Run `cargo bisect-rustc --script bisect.sh [--target=x86_64-unknown-none] --start=1.69.0 --end=1.71.0` tweaking the optional `--target` and the required `--start` and `--end` values as needed. These can be specific nightly dates or "regular" versions.
