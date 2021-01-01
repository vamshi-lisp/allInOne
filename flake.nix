{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
  };
  outputs = {home-manager, self, nixpkgs}: {
     # replace 'joes-desktop' with your hostname here.
     nixosConfigurations.cosmos = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       modules = [ 
       			./dotfiles/services/picom
			./dotfiles/services/redshift  
			./dotfiles/services/emacs 
			./dotfiles/programs/programs.nix
			./dotfiles/programs/desktop
			./dotfiles/programs/rtorrent
			#./dotfiles/services/desktop 
			./configuration.nix
			home-manager.nixosModules.home-manager
          		{
            			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
            			home-manager.users.vamshi = import ./home.nix;
          		}
		];
	     };
  	};
}
