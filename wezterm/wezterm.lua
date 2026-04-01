local wezterm = require("wezterm")
config = {}
config.font_size = 12
config.initial_cols = 120
config.initial_rows = 30
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "RESIZE"

config.audible_bell = "Disabled"
config.font = wezterm.font("Hack Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.use_fancy_tab_bar = false
config.color_scheme = "tokyonight_night"

local scheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
local bg = scheme.background

-- Windows Settings
config.launch_menu = {}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:archlinux"

	table.insert(config.launch_menu, {
		label = "PowerShell",
		args = { "powershell.exe", "-NoLogo" },
		domain = { DomainName = "local" },
	})
end

config.background = {
	{
		source = { File = wezterm.config_dir .. "/wallpapers/wallpaper.jpg" },
		vertical_align = "Middle",
		horizontal_align = "Center",
		height = "Cover",
		width = "Cover",
		opacity = 1.0,
		hsb = { brightness = 0.5 },
	},
	{
		source = { Color = bg },
		width = "100%",
		height = "100%",
		opacity = 0.6,
	},
}
config.text_background_opacity = 0.8

-- KEYBINDS
config.leader = { key = " ", mods = "SHIFT", timeout_milliseconds = 1000 }
config.keys = {
	{
		-- split horizontal
		key = '"',
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		-- split vertical
		key = "%",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- vim like commands for switching panes
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		-- command palette
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		-- show new tab launcher
		key = "c",
		mods = "LEADER",
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|LAUNCH_MENU_ITEMS|DOMAINS" }),
	},
	{
		-- find a tab
		key = "f",
		mods = "LEADER",
		action = wezterm.action.ShowTabNavigator,
	},
	{
		-- next tab
		key = "Tab",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		-- prev tab
		key = "Tab",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		-- close current tab with confirmation
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "0",
		mods = "LEADER",
		action = wezterm.action.ActivateTab(9),
	},
}

for tab = 1, 8 do
	table.insert(config.keys, {
		key = tostring(tab),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(tab - 1),
	})
end

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)
return config

