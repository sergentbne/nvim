local config = {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {},
	opts = {
		ensure_installed = { "bash", "rust", "python", "typescript" },
		auto_install = true,
	},
}
return config