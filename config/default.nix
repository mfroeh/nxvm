{ pkgs, ... }:
{
	imports = [ ./keymaps.nix ./telescope.nix ];

	plugins.lualine.enable = true;

	extraPlugins = [
		# dont move on yank
		# (pkgs.vimUtils.buildVimPlugin {
		# 	name = "YankAssassin.vim";
		# 	src = pkgs.fetchFromGitHub {
		# 		owner = "svban";
		# 		repo = "YankAssassin.vim";
		# 		rev = "main";
		# 		hash = "sha256-xuQ60dTv+GjU904SB+Nt3tclbNsOycZurdtYZWciD3A=";
		# 	};
		# })
	];

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

	plugins.nvim-autopairs.enable = true;
	plugins.rainbow-delimiters.enable = true;

	plugins.treesitter-context.enable = true;

	plugins.treesitter-textobjects = {
		enable = true;
		select = {
			enable = true;
			lookahead = true;
			includeSurroundingWhitespace = true;
			keymaps = {
				"aa" = "@parameter.outer";
				"ia" = "@parameter.inner";
				"af" = "@function.outer";
				"if" = "@function.inner";
				"ac" = "@class.outer";
				"ic" = "@class.inner";
			};
		};
		move = {
			enable = true;
			setJumps = true;
			gotoNextStart = {
				"]f" = "@function.outer";
				"]]" = "@class.outer";
			};
			gotoPreviousStart = {
				"[f" = "@function.outer";
				"[[" = "@class.outer";
			};
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
