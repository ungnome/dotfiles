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
-- config.color_scheme = "Catppuccin Mocha"
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
	weight = "DemiBold",
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
})

-- junk
wezterm.on("format-window-title", function(tab)
	local mux = wezterm.mux
	local zoomed = ""

	if tab.active_pane.is_zoomed then
		zoomed = " [Z]"
	end

	window_title = "Workspace: " .. mux.get_active_workspace() .. zoomed

	return window_title
end)

-- keybinds (tmuxify wezterm)
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = '"',
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						wezterm.action.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
			timeout_milliseconds = 1000,
		}),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "switch_pane",
			one_shot = false,
			timeout_milliseconds = 1000,
		}),
	},
}
config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },

		-- Cancel the mode by pressing escape
		{ key = "y", action = "PopKeyTable" },
	},
	switch_pane = {
		{ key = "LeftArrow", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "h", action = wezterm.action.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "l", action = wezterm.action.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "k", action = wezterm.action.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = wezterm.action.ActivatePaneDirection("Down") },
		{ key = "j", action = wezterm.action.ActivatePaneDirection("Down") },

		-- Cancel the mode by pressing escape
		{ key = "y", action = "PopKeyTable" },
	},
}

return config
