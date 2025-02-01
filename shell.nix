{ pkgs ? import <nixpkgs> { } }:
let
  #local-pico-sdk = pkgs.pico-sdk.override { withSubmodules = true; };
  local-pico-sdk = pkgs.pico-sdk;
in pkgs.mkShell {
  shellHook = ''
    export PICO_SDK_PATH=${local-pico-sdk}/lib/pico-sdk/
    			'';
  nativeBuildInputs = with pkgs.buildPackages; [
    gcc-arm-embedded
    protobuf
    cmake
    local-pico-sdk
  ];
}
