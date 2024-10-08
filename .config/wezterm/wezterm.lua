local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.initial_rows = 40
config.initial_cols = 140
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.native_macos_fullscreen_mode = true
config.font_size = 16.0
config.font = wezterm.font({
	family = "JetBrains Mono",
	weight = "Medium",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

return config
