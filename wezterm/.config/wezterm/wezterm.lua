-- wezterm junk
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- functions
local function get_color_scheme(appearance)
	if appearance:find 'Dark' then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
	end
end

-- window junk
config.scrollback_lines = 10000
config.audible_bell = "Disabled"
config.initial_rows = 40
config.initial_cols = 140

-- theme junk
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = get_color_scheme(wezterm.gui.get_appearance())

-- tabs junk
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- macos junk
config.native_macos_fullscreen_mode = true

-- font junk
config.font_size = 16.0
config.font = wezterm.font({
	family = "Hack",
})

-- keybind junk
config.leader = { key = "a", mods = "CTRL", timeou_milliseconds = 1000 }
config.keys = {
	-- send leader through if pressed twice
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },

	-- split pane
	{ key = "%", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- zoom pane
	{ key = "m", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- panes
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

	-- tabs
	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter new name for tab" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},

	-- window title
	{
		key = ".",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter Window Title" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:mux_window():set_title(line)
				end
			end),
		}),
	},

	-- copy mode
	{
		key = "[",
		mods = "LEADER",
		action = wezterm.action.ActivateCopyMode,
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

-- event handler junk
wezterm.on("format-window-title", function(tab, pane, tabs, panes, config)
	local zoomed = ""

	if tab.active_pane.is_zoomed then
		zoomed = "[Z]"
	end

	return tab.window_title .. " " .. zoomed
end)

return config
