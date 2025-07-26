local opt = vim.opt

opt.shiftwidth = 2
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.tabstop = 2
opt.softtabstop = 2
opt.scrolloff = 10
opt.expandtab = true
opt.smartindent = true
-- change to directory of current open file
opt.autochdir = true
-- go to beginning of next line when go right at end of line
opt.whichwrap:append("<>[]hl")
-- don't show mode since it's in the status line
opt.showmode = false
opt.breakindent = true
opt.undofile = true
-- ignore the case when searching unless use capital letter
opt.ignorecase = true
opt.smartcase = true
-- still don't really understand this
opt.signcolumn = "yes"
-- wait time after in ms after clicking command
opt.updatetime = 250
opt.timeoutlen = 1200
-- which way to split window
opt.splitright = true
opt.splitbelow = true

opt.inccommand = "split"

-- fill empty buffer strings with character
opt.fillchars = { eob = " " }

-- a highlight displaying which line your cursor is on
opt.cursorline = true

opt.hlsearch = true
