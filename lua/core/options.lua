vim.opt.nu = true
vim.opt.relativenumber = true

vim.cmd('filetype indent plugin on')
if not vim.g.syntax_on then
  vim.cmd('syntax enable')
end
vim.o.encoding = 'utf-8'
--vim.o.scriptencoding = 'utf-8'

--vim.opt.completeopt= "menu,menuone,noselect"
--vim.opt.pumblend ="highlight:Pmenu,border:off"
--vim.o.backspace = 'indent,eol,start'
vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.softtabstop = -1
vim.o.tabstop = 8
vim.o.textwidth = 80
vim.o.title = true

vim.o.hidden = true
--vim.o.nofixendofline = true
--vim.o.nostartofline = true
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.laststatus = 2
--vim.o.nonumber = true
--vim.o.noruler = true
--vim.o.noshowmode = true
vim.o.signcolumn = 'yes'

vim.o.mouse = 'a'
vim.o.updatetime = 1000

-- Colors: {{{
vim.cmd[[
  augroup ColorschemePreferences
    autocmd!
    " These preferences clear some gruvbox background colours, allowing transparency
    autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
    autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
    " Link ALE sign highlights to similar equivalents without background colours
    autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
    autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
    autocmd ColorScheme * highlight link ALEInfoSign    Identifier
  augroup END
]]
-- }}}

--use a autopairs
vim.g.AutoPairsFlyMode = 0


-- Use truecolor in the terminal, when it is supported
if vim.fn.has('termguicolors') == 1 then
vim.o.termguicolors = true
end

vim.o.background = "dark"
--vim.cmd("colorscheme gruvbox") -- Use the gruvbox colorscheme

-- ALE:
vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_style_warning = '·'


-- Lightline

