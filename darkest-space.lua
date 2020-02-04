-- source: https://github.com/szorfein/darkest-space

local lexers = vis.lexers

local colors = {
	['baseFG'] = '#E8DEB7', -- foreground
	['baseBG'] = '#262626', -- background
	['base01'] = '#D75F87', -- functions, alerts, bg TODO
	['base02'] = '#87AF5F', -- delimiters, operators, little characters
	['base03'] = '#FFFFAF', -- numbers
	['base04'] = '#5F8787', -- comments
	['base05'] = '#875FAF', -- identifiers
	['base06'] = '#B3A1B3', -- strings
	['base07'] = '#FFFFD7',
	['cust01'] = '#313131', -- line highlight
	['cust02'] = '#3F3F3F', -- selection
}

lexers.colors = colors

local fg = ',fore:'..colors.baseFG..','
local bg = ',back:'..colors.baseBG..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:'..colors.base05
lexers.STYLE_COMMENT = 'fore:'..colors.base04..',italics'
lexers.STYLE_CONSTANT = 'fore:'..colors.base06
lexers.STYLE_DEFINITION = 'fore:'..colors.base01
lexers.STYLE_ERROR = 'fore:'..colors.base01..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.base01
lexers.STYLE_KEYWORD = 'fore:'..colors.base01
lexers.STYLE_LABEL = 'fore:'..colors.base01
lexers.STYLE_NUMBER = 'fore:'..colors.base03
lexers.STYLE_OPERATOR = 'fore:'..colors.base02
lexers.STYLE_REGEX = 'fore:'..colors.base07
lexers.STYLE_STRING = 'fore:'..colors.base06
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.base07
lexers.STYLE_TAG = 'fore:'..colors.base01
lexers.STYLE_TYPE = 'fore:'..colors.base01
lexers.STYLE_VARIABLE = 'fore:'..colors.baseFG
lexers.STYLE_WHITESPACE = 'fore:'..colors.base04
lexers.STYLE_EMBEDDED = 'fore:'..colors.base07
lexers.STYLE_IDENTIFIER = 'fore:'..colors.base05

lexers.STYLE_LINENUMBER = 'fore:'..colors.base04..',back:'..colors.baseBG
lexers.STYLE_CURSOR = 'fore:'..colors.baseBG..',back:'..colors.baseFG
lexers.STYLE_CURSOR_PRIMARY = 'fore:'..colors.baseBG..',back:'..colors.base01
lexers.STYLE_CURSOR_LINE = 'back:'..colors.cust01
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base04
lexers.STYLE_SELECTION = 'back:'..colors.cust02
lexers.STYLE_STATUS = 'fore:'..colors.base03..',back:'..colors.baseBG
lexers.STYLE_STATUS_FOCUSED = 'fore:'..colors.baseBG..',back:'..colors.base03
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
