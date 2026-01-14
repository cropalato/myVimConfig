-- Custom YAML LSP configuration with schema mappings
-- Language servers and formatters are handled by LazyVim extras
return {
	"neovim/nvim-lspconfig",
	opts = {
		servers = {
			yamlls = {
				settings = {
					yaml = {
						format = {
							bracketSpacing = false,
						},
						schemaStore = {
							enable = true,
							url = "https://www.schemastore.org/api/json/catalog.json",
						},
						schemas = {
							["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.{yml,yaml}",
							["http://json.schemastore.org/chart"] = "Chart.yaml",
							["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
							["http://json.schemastore.org/helmfile"] = "helmfile.yaml",
						},
						validate = true,
						hover = true,
					},
				},
			},
		},
	},
}
