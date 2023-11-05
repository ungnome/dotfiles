local wezterm = require("wezterm")
local act = wezterm.action

-- functions
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

local function window_border_for_appearance(appearance)
	if appearance:find("Dark") then
		return "#b4befe"
	else
		return "#7287fd"
	end
end

return {
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
	-- color_scheme = "Catppuccin Mocha",

	colors = {
		cursor_bg = "#838ba7",
		cursor_fg = "white",
	},
	-- windows stuffs
	initial_rows = 35,
	initial_cols = 120,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	native_macos_fullscreen_mode = true,
	keys = {
		{ key = "_", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "SHIFT|ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "p", mods = "SHIFT|ALT|CTRL", action = act.PaneSelect },
	},
}
