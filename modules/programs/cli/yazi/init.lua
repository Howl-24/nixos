local catppuccin_theme = require("yatline-catppuccin"):setup("mocha") -- or "latte" | "frappe" | "macchiato"

-- Plugins
require("git"):setup()

require("zoxide"):setup({
	update_db = true,
})

require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}

require("yatline"):setup({
-- ===

	theme = catppuccin_theme,

-- ===
})
