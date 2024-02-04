local wezterm = require('wezterm')
local act = wezterm.action
-- local mux = wezterm.mux
local theme = 'Catppuccin Mocha'
local scheme = wezterm.color.get_builtin_schemes()[theme]
local config = {}

-- use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- settings
config.color_scheme = theme
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font Mono", scale = 1.1 },
	{ family = "FiraCode Nerd Font",           scale = 1.1 },
})
config.line_height = 1.1
config.window_background_opacity = 0.98
-- config.window_decorations = "RESIZE"
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_buttons = { 'Close' }
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "home"
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}
config.initial_cols = 80
config.initial_rows = 24
config.tab_max_width = 32

-- keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER",       action = act.SendKey { key = "a", mods = "CTRL" } },
	{ key = "c", mods = "LEADER",       action = act.ActivateCopyMode },

	-- Panes
	{ key = "-", mods = "LEADER",       action = act.SplitVertical { domain = "CurrentPaneDomain" } },
	-- shift is for when caps lock is on
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
	{ key = "h", mods = "LEADER",       action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER",       action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER",       action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER",       action = act.ActivatePaneDirection("Up") },
	{ key = "q", mods = "LEADER",       action = act.CloseCurrentPane { confirm = true } },
	{ key = "z", mods = "LEADER",       action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER",       action = act.RotatePanes "Clockwise" },
	-- KeyTable for resizing panes
	{ key = "r", mods = "LEADER",       action = act.ActivateKeyTable { name = "resize_pane", one_shot = false } },

	-- tabs
	{ key = "n", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER",       action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER",       action = act.ShowTabNavigator },
	-- keytable for moving tabs around
	{ key = "m", mods = "LEADER",       action = act.ActivateKeyTable { name = "move_tab", one_shot = false } },

	-- workspace
	{ key = "w", mods = "LEADER",       action = act.ShowLauncherArgs { flags = "FUZZY|WORKSPACES" } },
}

-- Quickly navigate tabs using the index
for i = 1, 9 do
	config.keys[#config.keys + 1] = {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	}
end

config.key_tables = {
	resize_pane = {
		{ key = "h",      action = act.AdjustPaneSize { "Left", 1 } },
		{ key = "l",      action = act.AdjustPaneSize { "Right", 1 } },
		{ key = "j",      action = act.AdjustPaneSize { "Down", 1 } },
		{ key = "k",      action = act.AdjustPaneSize { "Up", 1 } },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h",      action = act.MoveTabRelative(-1) },
		{ key = "l",      action = act.MoveTabRelative(1) },
		{ key = "j",      action = act.MoveTabRelative(-1) },
		{ key = "k",      action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter",  action = "PopKeyTable" },
	},
}

-- Tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

wezterm.on("update-status", function(window, pane)
	local stat = window:active_workspace()
	if window:active_key_table() then stat = window:active_key_table() end
	if window:leader_is_active() then stat = "LEADER" end

	local basename = function(path)
		local last = #path
		if path:sub(last, last) == "/" then
			path = path:sub(1, -2)
		end
		return string.gsub(path, "(.*[/\\])(.*)", "%2")
	end

	local cwd_uri = pane:get_current_working_dir()
	local cwd = basename(cwd_uri.file_path)
	local cmd = basename(pane:get_foreground_process_name())
	local time = os.date("%I:%M %p")


	window:set_right_status(wezterm.format({
		{ Foreground = { Color = scheme.brights[5] } },
		{ Text = wezterm.nerdfonts.oct_table .. " " .. stat },
		"ResetAttributes",
		{ Text = " • " },
		{ Foreground = { Color = scheme.brights[4] } },
		{ Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
		"ResetAttributes",
		{ Text = " • " },
		{ Foreground = { Color = scheme.brights[3] } },
		{ Text = wezterm.nerdfonts.oct_command_palette .. " " .. cmd },
		"ResetAttributes",
		{ Text = " • " },
		{ Text = wezterm.nerdfonts.md_clock .. " " .. time },
		{ Text = " " },
	}))
end)

return config
