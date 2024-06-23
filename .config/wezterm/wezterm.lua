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
		-- family = "Hack Nerd Font",
		-- weight = "DemiBold",
		harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	}),
	font_size = 16.0,

	-- theme stuffs
	-- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	color_scheme = "Catppuccin Mocha",

	-- window stuffs
	initial_rows = 40,
	initial_cols = 140,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	native_macos_fullscreen_mode = true,

	-- keybind stuffs
	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	-- keys = {
	-- 	{
	-- 		key = "|",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	-- 	},
	-- 	{
	-- 		key = "-",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	-- 	},
	-- 	{
	-- 		key = "m",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.TogglePaneZoomState,
	-- 	},
	-- 	{
	-- 		key = "r",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.ActivateKeyTable({
	-- 			name = "resize_pane",
	-- 			one_shot = false,
	-- 			timeout_milliseconds = 1000,
	-- 		}),
	-- 	},
	-- 	{
	-- 		key = "p",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.ActivateKeyTable({
	-- 			name = "switch_pane",
	-- 			one_shot = false,
	-- 			timeout_milliseconds = 1000,
	-- 		}),
	-- 	},
	-- 	{
	-- 		key = "t",
	-- 		mods = "LEADER",
	-- 		action = wezterm.action.ShowTabNavigator,
	-- 	},
	-- },
	-- key_tables = {
	-- 	resize_pane = {
	-- 		{ key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	-- 		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	--
	-- 		{ key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	-- 		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	--
	-- 		{ key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	-- 		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	--
	-- 		{ key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	-- 		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	--
	-- 		-- Cancel the mode by pressing escape
	-- 		{ key = "y", action = "PopKeyTable" },
	-- 	},
	-- 	switch_pane = {
	-- 		{ key = "LeftArrow", action = wezterm.action.ActivatePaneDirection("Left") },
	-- 		{ key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	--
	-- 		{ key = "RightArrow", action = wezterm.action.ActivatePaneDirection("Right") },
	-- 		{ key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	--
	-- 		{ key = "UpArrow", action = wezterm.action.ActivatePaneDirection("Up") },
	-- 		{ key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	--
	-- 		{ key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Down") },
	-- 		{ key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	--
	-- 		-- Cancel the mode by pressing escape
	-- 		{ key = "y", action = "PopKeyTable" },
	-- 	},
	-- },
}
