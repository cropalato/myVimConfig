-- avante.lua optimization
return {
	"yetone/avante.nvim",
	event = "VeryLazy", -- This is fine but could be more specific
	keys = {
		-- Add your specific keybindings here
	},
	opts = {
		provider = "openai",
		model = "o1-mini",
	},
	build = "make",
	dependencies = {
		{ "stevearc/dressing.nvim", lazy = true },
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{ "nvim-tree/nvim-web-devicons", lazy = true },
		{ "zbirenbaum/copilot.lua", lazy = true },
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true,
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "Avante" },
			opts = {
				file_types = { "markdown", "Avante" },
			},
		},
	},
}
