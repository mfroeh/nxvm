{ pkgs, lib, ... }:
{
  imports = [
    ./keymaps.nix
    ./treesitter.nix
    ./telescope.nix
  ];

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

  plugins.neorg.enable = true;
  plugins.neorg.settings.load = {
    "core.concealer" = {
      config = {
        icon_preset = "varied";
      };
    };
    "core.dirman" = {
      config = {
        workspaces = {
          mine = "~/notes";
        };
        default_workspace = "mine";
      };
    };
    "core.journal" = {
      config = {
        strategy = "flat";
        workspace = "mine";
      };
    };
  };

  plugins.lazygit.enable = true;
  plugins.gitsigns.enable = true;
  plugins.gitsigns.settings.current_line_blame = true;

  keymaps = [
    {
      mode = "n";
      key = "gm";
      action = "<cmd>LazyGit<cr>";
    }
    {
      mode = "n";
      key = "[h";
      action = "<cmd>Gitsigns nav_hunk prev<cr>";
    }
    {
      mode = "n";
      key = "]h";
      action = "<cmd>Gitsigns nav_hunk next<cr>";
    }
  ];

  plugins.nvim-surround.enable = true;

  plugins.blink-cmp.enable = true;

  plugins.oil.enable = true;

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

  plugins = {
    lsp = {
      enable = true;

      servers = {
        nixd.enable = true;
        gopls.enable = true;
        protols.enable = true;

        rust_analyzer.enable = true;
        # install this per project instead
        rust_analyzer.installRustc = false;
        rust_analyzer.installCargo = false;
      };
    };
    # plugins.lsp.inlayHints = true;
    lsp.luaConfig.post = ''
      		vim.diagnostic.config({
      			virtual_text = true,
      			signs = true,
      			underline = true,
      			update_in_insert = false,
      			severity_sort = true,
      		})
    '';
    lsp.keymaps.lspBuf = {
      K = "hover";
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
    };
  };
  plugins.lspsaga.enable = true;

  plugins.lsp-format.enable = true;
  plugins.lsp-signature.enable = true;

  plugins.nvim-autopairs.enable = true;
  plugins.rainbow-delimiters.enable = true;

  plugins.comment.enable = true;

  # todo
  performance.byteCompileLua = {
    enable = false;
    initLua = true;
    nvimRuntime = true;
    plugins = true;
  };
}
