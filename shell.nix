{ pkgs ? import <nixpkgs> {} }:
let
	pico-sdk-full= pkgs.pico-sdk.overrideAttrs(oldAttrs:
	rec {
		pname = "pico-sdk";
		version = "1.5.1";
		src= pkgs.fetchgit {
					url="https://github.com/raspberrypi/pico-sdk.git";
					name ="source";
					branchName = version;
					leaveDotGit = true;
					postFetch = ''
						cd $out
						cat .gitmodules
						# reset git status
						git reset --hard HEAD
						git submodule update --init
						find . -type d -name ".git"  -exec rm -rf {} +;
					'';
					sha256 = "sha256-2wTAeCc26lSlP+Pjv3tjCBqVJaiKEtfpWMeOh4SNpUE=";
					# don't fetch submodules
					fetchSubmodules = false;
			};
			nativeBuildInputs = with pkgs;[ cmake ];

			installPhase = oldAttrs.installPhase + ''


			'';
		});

in
	pkgs.mkShell {
		shellHook =
			''
export PICO_SDK_PATH=${pico-sdk-full}/lib/pico-sdk/
			'';
			nativeBuildInputs = with pkgs.buildPackages; [
				gcc-arm-embedded
				protobuf cmake pico-sdk
			];
		}
