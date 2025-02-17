local lush = require('lush')
local hsl = lush.hsl -- We'll use hsl a lot so its nice to bind it separately

local teal  = hsl("#1D5B79") -- Vim has a mapping, <n>C-a and <n>C-x to
local turquoise = hsl("#3AA6B9")  -- increment or decrement integers, or
local pink  = hsl("#FF9EAA")  -- you can just type them normally.
local light_pink = hsl("#FFD0D0")
local pastel_red = hsl("#EF6262")
local dark_gray = hsl("#212121")
local white = hsl("#A0A0A0")

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

    return {
    Normal { bg = hsl("#101010"), fg = pink },-- Goodbye gray, hello blue!
    CursorLine { bg = dark_gray, fg = turquoise }, -- lighten() can also be called via li()
    Visual { fg = pink, bg = teal }, -- Try pressing v and selecting some text
    Comment { fg = dark_gray.de(25).li(25).ro(-10) },
    CursorCollumn { fg=pink}, -- CursorColumn is linked to CursorLine
    LineNr { fg=turquoise , gui = "bold" },
	LineNrBelow { fg = teal, gui="italic" },
    LineNrAbove { fg = teal, gui="italic" },
    CursorLineNr { LineNr, fg = pastel_red },
    search_base  { bg = teal, fg = pink },
    Search       { search_base },
    IncSearch    { search_base },

    Directory {fg = pastel_red},
	Define {fg = turquoise},
    Conditional {fg = pastel_red},
	Type {fg = pink, gui="bold"},
	Function {fg = pastel_red, gui="italic"},
	Keyword {fg = pink, gui="bold"},
    String {fg = teal, gui="bold"},
    Delimiter {fg = white, gui="bold"},
	Identifier {fg = light_pink, gui="underline,italic"},
	Title {fg = white, gui="underline"},
	Macro {fg = pastel_red},
	StatusLine {bg = teal, fg= light_pink},
	ModeMsg {fg = pastel_red},
	Error {fg = dark_gray, bg = pastel_red},
    TelescopeNormal {fg = light_pink},
	TelescopePromptBorder {fg = turquoise, bg = dark_gray},
	TelescopePromptNormal {fg = pink, gui="bold"},
    TelescopeResultsBorder {fg = pink, bg = dark_gray , gui="bold"},
    TelescopeResultsTitle {fg = pastel_red},
	TelescopeSelection {fg = turquoise},
	TelescopePreviewBorder {fg = pink, bg = dark_gray},
    TelescopePreviewTitle {fg = pastel_red},
	TelescopeMatching {fg = pastel_red},
	WinSeparator {fg = pastel_red },
	sym"@variable.builtin" {fg = teal},
	sym"@variable" {fg = light_pink},
    sym"@lsp.type.macro" {fg = pastel_red},
    sym"@lsp.type.comment" {Comment},
    sym"@lsp.type.conditional" {Conditional},
    sym"@lsp.type.number" {fg = white},
    sym"@string.escape" {fg = pastel_red},
    sym"@character.special" {fg = pastel_red},
	sym"@lsp.type.parameter" {fg = pink, gui="bold,italic"},
	sym"@lsp.type.decorator" {fg = turquoise, gui="bold,italic"},
	sym"@lsp.type.typeParameter" {fg = pastel_red},
	sym"@lsp.type.type" {fg = pastel_red},
	sym"@lsp.type.enum" {fg = teal, gui="bold,underline"},
	sym"@lsp.type.enumMember" {fg = turquoise},
	Structure {fg = turquoise},
    sym"@lsp.type.struct" {fg = turquoise, gui="bold,underline"},
	sym"@lsp.type.class" {fg = turquoise, gui="bold,underline"},
	sym"@lsp.type.interface" {fg = pastel_red, gui="bold,underline"},
    sym"@lsp.type.operator" {fg = pastel_red, gui="bold"},
}
end)

-- Return our parsed theme for use and that's the basics of using Lush!
-- Th parsed theme can be used as a neovim theme, or extended further via Lush,
-- or used elsewhere such as in other lua runtimes.
return theme
