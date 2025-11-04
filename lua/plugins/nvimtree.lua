return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({
				renderer = {
					icons = {
						show = {
							file = true,
							folder = true,
							folder_arrow = true,
							git = true,
						},
					},
				},
                                actions = {
                                open_file = {
                                    quit_on_open = true,
                                    }
                                },
                                filters = {
                                    dotfiles=true,
                                },
			})
		end,
	},
}
