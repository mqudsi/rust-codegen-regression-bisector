#!/bin/sh

# Output directory is $CARGO_TARGET_DIR/$CARGO_BUILD_TARGET/[debug|release]
echo Testing $(echo ${CARGO_TARGET_DIR} | sed -r 's/target-bisector-//g'):

cargo rustc --release -- -C opt-level=3 -C debuginfo=0 -C target-cpu=x86-64-v4 --emit=llvm-ir
# Adjust this test condition as needed so the return value of the script is 0 on good, non-zero on bad.
! grep "bb5:" ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/deps/*.ll 2>&1
