{ ... }:
{
	globals = {
		mapleader = " ";
		maplocalleader = ",";
	};

	keymaps = [
		# move highlighted lines with J and K in visual mode
		{
			key = "J";
			mode = "v";
			action = ":m '>+1<CR>gv=gv";
		}
		{
			key = "K";
			mode = "v";
			action = ":m '<-2<CR>gv=gv";
		}
		# stay in visual mode after indenting
		{
			key = "<";
			mode = "v";
			action = "<gv";
		}
		{
			key = ">";
			mode = "v";
			action = ">gv";
		}
		# keep cursor in the center
		{
			key = "<C-d>";
			mode = "n";
			action = "<C-d>zz";
		}
		{
			key = "<C-u>";
			mode = "n";
			action = "<C-u>zz";
		}
		{
			key = "n";
			mode = "n";
			action = "nzzzv";
		}
		{
			key = "N";
			mode = "n";
			action = "Nzzzv";
		}
		# dont move cursor when joining lines
		{
			key = "J";
			mode = "n";
			action = "mzJ'z";
		}
		# pageUp/pageDown should function as C-u and C-d
		{
			key = "<PageDown>";
			mode = "n";
			action = "<C-d>zz";
		}
		{
			key = "<PageUp>";
			mode = "n";
			action = "<C-u>zz";
		}
	];
}
