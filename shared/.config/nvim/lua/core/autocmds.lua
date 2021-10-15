vim.cmd("autocmd!")
vim.cmd("autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 150})")
-- vim.cmd("au FileType python setlocal indentkeys-=<:>")
-- vim.cmd("au FileType python setlocal indentkeys-=:")
