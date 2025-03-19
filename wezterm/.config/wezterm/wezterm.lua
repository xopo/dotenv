local wezterm = require("wezterm")

local config = {}
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true
config.enable_scroll_bar = true
-- config.link_opens_in_browser = true

wezterm.on("update-status", function(window) --, _pane)
	local overrides = window:get_config_overrides() or {}
	if window:is_focused() then
		overrides.colors = {
			tab_bar = {
				background = "#ff0000", --#1e1e1e",
			},
		}
	else
		overrides.colors = {
			tab_bar = {
				background = "#0000",
			},
		}
	end
	window:get_config_overrides(overrides)
end)

return config
