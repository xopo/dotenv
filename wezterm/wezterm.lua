config.enable_scroll_bar = true
config.link_opens_in_browser = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.keys = {
	{ key = "j", mods = "ALT", action = wezterm.action({ SendString = "\\033j" }) }, -- Example binding
	{ key = "k", mods = "ALT", action = wezterm.action({ SendString = "\\033k" }) }, -- Example binding
}
-- 	default_key_bindings = false, -- Disable the default key bindings
-- 	send_composed_key_to_terminal = true, -- Ensure composed keys like Option+J are passed through
-- }
