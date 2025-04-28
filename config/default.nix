{ pkgs, ... }:
{
	imports = [ ./remaps.nix ];

	plugins.lualine.enable = true;

	extraPlugins = [
		# dont move on yank
		(pkgs.vimUtils.buildVimPlugin {
		name = "YankAssassin.vim";
		src = pkgs.fetchFromGitHub {
			owner = "svban";
			repo = "YankAssassin.vim";
			rev = "main";
			hash = "sha256-xuQ60dTv+GjU904SB+Nt3tclbNsOycZurdtYZWciD3A=";
		};
	})];

	opts = {
		number = true;
		relativenumber = true;

		# indent/tab
		tabstop = 2;
		softtabstop = 2;
		shiftwidth = 2;
		shiftround = true;

		# search
		ignorecase = true;
		smartcase = true;

		showmode = false;
		laststatus = 3;

		splitright = true;
		splitbelow = true;

		wrap = true;
		linebreak = true;
		showbreak = "↳ ";

		list = true;
		listchars = "tab:▸·,extends:»,precedes:«,nbsp:·,eol:↵,trail:␣";

		cursorline = true;
		scrolloff = 8;

		gdefault = true;

		autoread = true;

		signcolumn = "yes";

		undofile = true;
		swapfile = false;

		virtualedit = "block";
	};

	colorschemes = {
		nightfox.enable = true;
		# “carbonfox”, “dawnfox”, “dayfox”, “duskfox”, “nightfox”, “nordfox”, “terafox”
		nightfox.flavor = "terafox";
	};

	plugins.lsp = {
		enable = true;

		servers = {
			nixd.enable = true;
		};
	};

	plugins.treesitter = {
		enable = true;
		settings = {
			highlight.enable = true;
			indent.enable = true;
		};
	};

	# todo
	performance.byteCompileLua = {
		enable = false;
		initLua = true;
		nvimRuntime = true;
		plugins = true;
	};
}
