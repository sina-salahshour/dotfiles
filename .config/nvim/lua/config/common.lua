vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.g.material_style = "darker"
vim.cmd 'colorscheme material'
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})

vim.wo.relativenumber = true
