local wezterm = require("wezterm")

-- functions
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

return {
	-- general stuffs
	scrollback_lines = 10000,

	-- font stuffs
	font = wezterm.font({
		family = "JetBrains Mono",
		weight = "DemiBold",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	}),
	font_size = 15.0,
	line_height = 1.1,

	-- theme stuffs
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	colors = {
		cursor_bg = "#838ba7",
		cursor_fg = "white",
	},

	-- window stuffs
	initial_rows = 40,
	initial_cols = 140,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	native_macos_fullscreen_mode = true,

	-- keybind stuffs
	disable_default_key_bindings = true,
	keys = {
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "{", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "{", mods = "SUPER|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
		{ key = "}", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "}", mods = "SUPER|SHIFT", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "X", mods = "CTRL|SHIFT", action = wezterm.action.ActivateCopyMode },
		{ key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	},
}
