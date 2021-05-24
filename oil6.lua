-- @TODO Improve me.
local is_color = function (v)
	return type(v) == "string"
end

local style = function (fg, bg)
	return setmetatable({
		fg = fg,
		bg = bg,
		bold = function (self)
			self.is_bold = true
			return self
		end,
		italic = function (self)
			self.is_italic = true
			return self
		end,
	}, {
		__tostring = function (t)
			local parts = {}
			if is_color(t.fg) then table.insert(parts, string.format("fore:%s",t.fg)) end
			if is_color(t.bg) then table.insert(parts, string.format("back:%s",t.bg)) end
			if t.is_bold then table.insert(parts, "bold") end
			if t.is_italic then table.insert(parts, "italics") end
			return table.concat(parts, ",")
		end,
	})
end

local background = function (bg) return style(nil, bg) end

local apply_styles = function (lx, st)
	for k, s in pairs(st) do
		lx[k] = tostring(s)
	end
end

-- The palette was taken from https://lospec.com/palette-list/oil-6.
local colors = {
	white = '#FBF5EF',
	yellow = '#F2D3AB',
	red = '#C69FA5',
	purple = '#8B6D9C',
	blue = '#494D7E',
	dark_blue = '#272744',
}

-- @TODO Is this actually required?
vis.lexers.colors = colors

local default_style = style(colors.white, colors.dark_blue)

apply_styles(vis.lexers, {
	STYLE_DEFAULT = default_style,
	STYLE_NOTHING = background(colors.dark_blue),
	STYLE_CLASS = style(colors.white),
	STYLE_COMMENT = style(colors.blue):italic(),
	STYLE_CONSTANT = style(colors.yellow),
	STYLE_DEFINITION = style(colors.white),
	STYLE_ERROR = style(colors.white):italic(),
	STYLE_FUNCTION = style(colors.red),
	STYLE_KEYWORD = style(colors.yellow),
	STYLE_LABEL = style(colors.red),
	STYLE_NUMBER = style(colors.red),
	STYLE_OPERATOR = style(colors.white),
	STYLE_REGEX = style(colors.white),
	STYLE_STRING = style(colors.yellow),
	STYLE_PREPROCESSOR = style(colors.red),
	STYLE_TAG = style(colors.red),
	STYLE_TYPE = style(colors.red),
	STYLE_VARIABLE = style(colors.white),
	STYLE_WHITESPACE = style(colors.white),
	STYLE_EMBEDDED = style(colors.white),
	STYLE_IDENTIFIER = style(colors.white),
	STYLE_LINENUMBER = style(colors.blue, colors.dark_blue),
	STYLE_CURSOR = style(colors.white, colors.blue),
	STYLE_CURSOR_PRIMARY = style(colors.white, colors.blue),
	STYLE_CURSOR_LINE = background(colors.purple),
	STYLE_COLOR_COLUMN = background(colors.purple),
	STYLE_SELECTION = style(colors.dark_blue, colors.purple),
	STYLE_STATUS = style(colors.dark_blue, colors.white),
	STYLE_STATUS_FOCUSED = style(colors.white, colors.blue),
	STYLE_SEPARATOR = default_style,
	STYLE_INFO = style(colors.dark_blue, colors.white):bold(),
	STYLE_EOF = '',
})

