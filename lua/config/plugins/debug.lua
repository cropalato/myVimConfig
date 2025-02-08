return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim", -- Added for automatic DAP installation
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Mason-nvim-dap setup
			require("mason-nvim-dap").setup({
				automatic_installation = true,
				ensure_installed = {
					"delve", -- Go debugger
					"debugpy", -- Python debugger
				},
				handlers = {
					function(config)
						-- all sources with no handler get passed here
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})

			-- DAP UI setup
			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸" },
				mappings = {
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.25 },
							{ id = "breakpoints", size = 0.25 },
							{ id = "stacks", size = 0.25 },
							{ id = "watches", size = 0.25 },
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							{ id = "repl", size = 0.5 },
							{ id = "console", size = 0.5 },
						},
						size = 10,
						position = "bottom",
					},
				},
			})

			-- Health checks setup
			vim.api.nvim_create_autocmd("User", {
				pattern = "DapHealthCheck",
				callback = function()
					local messages = {}
					-- Check if debuggers are available
					if not pcall(require, "dap-go") then
						table.insert(messages, "Go debugger not found")
					end
					if not pcall(require, "dap-python") then
						table.insert(messages, "Python debugger not found")
					end

					-- Return health check results
					if #messages == 0 then
						vim.health.ok("DAP is properly configured")
					else
						vim.health.error("DAP configuration issues", messages)
					end
				end,
			})

			-- Dap UI autocommands
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dap-repl",
				callback = function()
					require("dap.ext.autocompl").attach()
				end,
			})

			-- Auto open/close DAP UI
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Configure Go debugging
			require("dap-go").setup({
				-- delve configurations
				delve = {
					initialize_timeout_sec = 20,
					port = "${port}",
				},
			})

			-- Configure Python debugging
			require("dap-python").setup("python")
			table.insert(require("dap").configurations.python, {
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					-- Detect if we're in a virtual environment
					if vim.env.VIRTUAL_ENV then
						return vim.env.VIRTUAL_ENV .. "/bin/python"
					end
					return "python"
				end,
			})

			-- Key mappings
			vim.keymap.set("n", "<F5>", function()
				require("dap").continue()
			end)
			vim.keymap.set("n", "<F10>", function()
				require("dap").step_over()
			end)
			vim.keymap.set("n", "<F11>", function()
				require("dap").step_into()
			end)
			vim.keymap.set("n", "<F12>", function()
				require("dap").step_out()
			end)
			vim.keymap.set("n", "<leader>b", function()
				require("dap").toggle_breakpoint()
			end)
			vim.keymap.set("n", "<leader>B", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
			vim.keymap.set("n", "<leader>lp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end)
			vim.keymap.set("n", "<leader>dr", function()
				require("dap").repl.open()
			end)

			-- UI toggle
			vim.keymap.set("n", "<leader>du", function()
				require("dapui").toggle()
			end)
		end,
	},
}
