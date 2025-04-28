{ ... }: {
	plugins.telescope = {
		enable = true;
		keymaps = {
			"<return>" = {
				action = "git_files";
			};
			"<c-,>" = {
				action = "buffers";
			};
		};
	};
}
