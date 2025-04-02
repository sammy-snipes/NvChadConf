require("nvchad.options")

-- add yours here!
vim.cmd([[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]])

-- misc optiosn
local o = vim.o
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
