{ ... }: {
	plugins.treesitter = {
		enable = true;
		settings = {
			highlight.enable = true;
			indent.enable = true;
		};
	};

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
}
