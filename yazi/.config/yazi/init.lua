require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

function Linemode:custom()
	local time = math.floor(self._file.cha.mtime or 0)
	local nicetime = os.date("%d %b %Y", time)
	local size = self._file:size()

	return string.format("%s %s ", size and ya.readable_size(size) or " - ", nicetime)
end

Status:children_add(function()
	local h = cx.active.current.hovered

	if not h or not ya.user_name then
		return ui.Line({})
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		ui.Span(":"),
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		ui.Span(" "),
	})
end, 500, Status.RIGHT)
