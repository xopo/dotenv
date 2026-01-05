local config={}
config.enable_scroll_bar = true
config.link_opens_in_browser = true
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.keys = {
	{ key = "j", mods = "ALT", action = wezterm.action({ SendString = "\\033j" }) }, -- Example binding
	{ key = "k", mods = "ALT", action = wezterm.action({ SendString = "\\033k" }) }, -- Example binding
}

export config
