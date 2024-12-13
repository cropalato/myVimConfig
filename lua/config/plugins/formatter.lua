return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--parser", "yaml" },
				},
			},
			format_on_save = function(bufnr)
				local bufname = vim.api.nvim_buf_get_name(bufnr)

				-- Disable file formatting on any temporary buffer contents
				if bufname:match("helmfile.yaml") then
					return
				else
					return {
						timeout_ms = 2500,
						lsp_fallback = true,
					}
				end
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
