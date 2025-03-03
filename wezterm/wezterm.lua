local wezterm = require("wezterm")
local act = wezterm.action

local light_theme = "Catppuccin Latte"
-- local dark_theme = 'Tokyo Night Storm'
-- local dark_theme = 'bnpne'
local dark_theme = "Vs Code Dark+ (Gogh)"
-- local dark_theme = 'Kanagawa (Gogh)'
-- local dark_theme = 'nordic'
-- local dark_theme = 'Gruvbox dark, soft (base16)'

wezterm.on("update-right-status", function(window, pane)
	local cells = {}

	local cwd_uri = pane:get_current_working_dir()
	if cwd_uri then
		local cwd = ""
		local hostname = ""

		if type(cwd_uri) == "userdata" then
			cwd = cwd_uri.file_path
			hostname = cwd_uri.host or wezterm.hostname()
		else
			cwd_uri = cwd_uri:sub(8)
			local slash = cwd_uri:find("/")

			if slash then
				hostname = cwd_uri:sub(1, slash - 1)
				cwd = cwd_uri:sub(slash):gsub(wezterm.home_dir, "~"):gsub("%%(%x%x)", function(hex)
					return string.char(tonumber(hex, 16))
				end)
			end
		end

		local dot = hostname:find("[.]")
		if dot then
			hostname = hostname:sub(1, dot - 1)
		end
		if hostname == "" then
			hostname = wezterm.hostname()
		end

		table.insert(cells, cwd)
		table.insert(cells, hostname)
	end

	local date = wezterm.strftime("%a %-d %b - %H:%M:%S")
	table.insert(cells, date)

	for _, b in ipairs(wezterm.battery_info()) do
		table.insert(cells, string.format("%.0f%%", b.state_of_charge * 100))
	end

	local overrides = window:get_config_overrides() or {}
	local is_dark_theme = not overrides.color_scheme and true or overrides.color_scheme == dark_theme

	-- Nordic
	-- local statusline_fg = '#D8DEE9'
	-- local statusline_bg = '#242933'

	-- Melange
	local statusline_fg = "#ECE1D7"
	local statusline_bg = "#292522"

	-- bamboo
	-- local statusline_fg = '#ece1c0'
	-- local statusline_bg = '#232923'

	local elements = {}
	local num_cells = 0

	local function push(text, is_last)
		table.insert(elements, { Foreground = { Color = statusline_fg } })
		table.insert(elements, { Background = { Color = statusline_bg } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = statusline_fg } })
			table.insert(elements, { Text = "|" })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		push(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

wezterm.on("toggle-colorscheme", function(window)
	local overrides = window:get_config_overrides() or {}

	if not overrides.color_scheme then
		overrides.color_scheme = dark_theme
	else
		overrides.color_scheme = overrides.color_scheme == light_theme and dark_theme or light_theme
	end

	window:set_config_overrides(overrides)
end)

wezterm.on("format-tab-title", function(tab)
	local title = tab.tab_title
	if not title or #title == 0 then
		title = tab.active_pane.title
	end
	return {
		{ Text = " [" .. tab.tab_index + 1 .. ":" .. title .. "]" },
	}
end)

return {
	-- So the cursor shows the text under it
	force_reverse_video_cursor = true,
	-- Font

	font = wezterm.font_with_fallback({
		{
			family = "Zed Mono",
			weight = 450,
			italic = false,
		},
		-- {
		--   family = 'Iosevka Term SS18',
		--   weight = 450,
		--   -- italic = true,
		-- },
		-- {
		--   family = 'PP Fraktion Mono',
		--   weight = 450
		-- }
	}),
	font_size = 15.5,
	-- font_size = 14.5,
	line_height = 0.9,
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	-- Colors
	color_schemes = color_schemes,
	color_scheme = dark_theme,
	-- color_scheme = light_theme,

	-- Window
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,
	tab_bar_at_bottom = true,
	tab_max_width = 26,
	window_frame = {
		-- font = wezterm.font({family = 'Iosevka Term SS18'}),
		-- active_titlebar_bg = '#292522',
		-- active_titlebar_fg = '#ECE1D7',
		-- inactive_titlebar_bg = '#161616',
		-- inactive_titlebar_fg = '#242933',
	},
	window_padding = {},
	initial_rows = 120,
	initial_cols = 350,
	enable_scroll_bar = false,
	max_fps = 60,

	-- Opacity and blur
	-- window_background_opacity = 0.86,
	window_background_opacity = 1,
	macos_window_background_blur = 15,

	-- Cursor
	cursor_blink_rate = 500,
	default_cursor_style = "BlinkingBar",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",

	-- Keymaps
	keys = {
		{
			key = "e",
			mods = "CMD",
			action = act.EmitEvent("toggle-colorscheme"),
		},
		{
			key = "k",
			mods = "CMD",
			action = act.ClearScrollback("ScrollbackAndViewport"),
		},
		{
			key = "c",
			mods = "CMD|SHIFT",
			action = wezterm.action.ActivateCopyMode,
		},
		-- Pane navigation
		{
			key = "d",
			mods = "CMD",
			action = wezterm.action.SplitPane({
				direction = "Right",
				size = { Percent = 50 },
			}),
		},
		{
			key = "d",
			mods = "CMD|SHIFT",
			action = wezterm.action.SplitPane({
				direction = "Down",
				size = { Percent = 50 },
			}),
		},
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "h",
			mods = "CTRL|CMD",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "l",
			mods = "CTRL|CMD",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "k",
			mods = "CTRL|CMD",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "j",
			mods = "CTRL|CMD",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|CMD",
			action = act.AdjustPaneSize({ "Left", 1 }),
		},
		{
			key = "RightArrow",
			mods = "CTRL|CMD",
			action = act.AdjustPaneSize({ "Right", 1 }),
		},
		{
			key = "UpArrow",
			mods = "CTRL|CMD",
			action = act.AdjustPaneSize({ "Up", 1 }),
		},
		{
			key = "DownArrow",
			mods = "CTRL|CMD",
			action = act.AdjustPaneSize({ "Down", 1 }),
		},
	},
}
