{
    description = "My minimal flake"

    inputs = {
        # Where most of the software is retrieved from
	nixpakcages.url = "github:nixos/nixpkgs/nixpkgs-unstable";

	# Manages configs links things into your home directory
	home-manager.url = "github:nix-community/home-manager/master";
	home-manager.inputs.nixpkgs.follows = "nixpkgs";

	# Controls system level software abnd settings including fonts
	darwin.url="github:ln17/nix-darwin";
	darwin.inputs.nixpkgs.follows = "nixpkgs"

    };

    outputs = inputs:  {
	darwinConfiguration.Charless-Mini.lan = inputs.darwn.lib.darwinSystem {
		system = "aarch64-darwin";
		pkgs = import input.nixpkgs { system = "aarch64-darwin"; };
		};
		modules = [ 
			({pkgs, ...}:i {
				# here go the darwin preferences and configuration
				programs.zsh.enable = true;
			}) 
		];
	};
};
