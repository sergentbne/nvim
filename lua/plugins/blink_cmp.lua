local config = {
	"saghen/blink.cmp",
	version = "2.*",

	dependencies = {
		"saghen/blink.lib",
	},

	build = function()
		-- build the fuzzy matcher, wait up to 60 seconds
		-- you can use `gb` in `:Lazy` to rebuild the plugin as needed
		require("blink.cmp").build():wait(60000)
	end,
	opts = {
		keymap = { preset = "default" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
			menu = {
				enabled = true,
				border = "rounded",
			},

			accept = {
				auto_brackets = { enabled = true }, -- Enable this line
			},
		},
		sources = {},
		snippets = {},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- fuzzy = { implementation = "rust" },
		signature = { enabled = true },
	},
}
return config
