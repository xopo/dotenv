local old_linemode = Folder.linemode
function Folder:linemode(area)
	if cx.active.conf.linemode ~= "my-own" then
		return old_linemode(self, area)
	end

	local lines = {}
	local year = os.date("%Y")
	for _, f in ipairs(self:by_kind(self.CURRENT).window) do
		local time = f.cha.modified // 1
		if time and os.date("%Y", time) == year then
			time = os.date("%b %d  %Y", time)
		else
			time = time and os.date("%b %d %H:%M", time) or ""
		end

		local size = f:size()
		lines[#lines + 1] = ui.Line({
			ui.Span(" "),
			ui.Span(size and ya.readable_size(size):gsub(" ", "") or "-"),
			ui.Span(" "),
			ui.Span(time),
			ui.Span(" "),
		})
	end
	return ui.Paragraph(area, lines):align(ui.Paragraph.RIGHT)
end

function Manager:render(area)
	local chunks = self:layout(area)

	local bar = function(c, x, y)
		x, y = math.max(0, x), math.max(0, y)
		return ui.Bar(ui.Rect({ x = x, y = y, w = ya.clamp(0, area.w - x, 1), h = math.min(1, area.h) }), ui.Bar.TOP)
			:symbol(c)
	end

	return ya.flat({
		-- Borders
		ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED),
		ui.Bar(chunks[1], ui.Bar.RIGHT),
		ui.Bar(chunks[3], ui.Bar.LEFT),

		bar("┬", chunks[1].right - 1, chunks[1].y),
		bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
		bar("┬", chunks[2].right, chunks[2].y),
		bar("┴", chunks[2].right, chunks[1].bottom - 1),

		-- Parent
		Parent:render(chunks[1]:padding(ui.Padding.xy(1))),
		-- Current
		Current:render(chunks[2]:padding(ui.Padding.y(1))),
		-- Preview
		Preview:render(chunks[3]:padding(ui.Padding.xy(1))),
	})
end