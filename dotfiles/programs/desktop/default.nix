{ pkgs, config, lib, inputs, ... }:{
    home-manager.users.vamshi.xsession.windowManager.xmonad = {
                                    enable = true;
				    enableContribAndExtras = true;
				    config = ./xmonad/xmonad.hs;
			};


}
