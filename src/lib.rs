#![allow(internal_features)]
#![feature(core_intrinsics)]
#![no_main]
#![no_std]

#[derive(PartialEq, Copy, Clone)]
pub enum WSL {
    Any,
    V1,
    V2,
}

#[inline(never)]
pub fn is_wsl(wsl: Option<WSL>, v: WSL) -> bool {
    wsl.map(|wsl| v == WSL::Any || wsl == v).unwrap_or(false)
}
