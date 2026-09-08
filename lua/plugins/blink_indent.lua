local config = {
	"saghen/blink.indent",
	--- @module 'blink.indent'
	--- @type blink.indent.Config
	opts = {
		highlights = { "BlinkIndent" },
		static = {
			enabled = true,
			char = "▎",
			whitespace_char = nil, -- inherits from `vim.opt.listchars:get().space` when `nil` (see `:h listchars`)
			priority = 1,
			-- specify multiple highlights here for rainbow-style indent guides
			-- highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
			highlights = { "BlinkIndent" },
		},
		scope = {
			enabled = true, -- highlight highest level of indentation on the current line
			indent_at_cursor = false, -- clamp to indent level of cursor
			char = "▎",
			priority = 1000,
			-- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
			-- highlights = { 'BlinkIndentScope' },
			-- optionally add: 'BlinkIndentRed', 'BlinkIndentCyan', 'BlinkIndentYellow', 'BlinkIndentGreen'
			highlights = { "BlinkIndentViolet" },
			-- enable to show underlines on the line above the current scope
			underline = {
				enabled = false,
				-- optionally add: 'BlinkIndentRedUnderline', 'BlinkIndentCyanUnderline', 'BlinkIndentYellowUnderline', 'BlinkIndentGreenUnderline'
				highlights = { "BlinkIndentOrangeUnderline", "BlinkIndentVioletUnderline", "BlinkIndentBlueUnderline" },
			},
		},
	},
}
return config
