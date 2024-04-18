-- [[ Basic options and autocmds ]]
require('base.options')
require('base.autocmd')
require('utils.mapper').map(require('base.mappings'))
-- [[ End of basic configuration ]]



-- [[ Plugin configuration ]]
-- Bootstrap the package manager lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install and configure plugins (each has corresponding file in lua/plugins)
require("lazy").setup({
  spec = { import = "plugins" },
  change_detection = { notify = false },
})
-- TODO: Mappings:
-- [ ]. remap every listing to <leader>l
-- [ ]. remap every lsp action to <leader>c
-- [ ]. remap diagnostics to <leader>? (maybe even without <leader>)
-- [ ]. remap show documentation to <leader>d
-- [ ]. remap show fun signature to <leader>f (maybe better to autoshow)
-- [ ]. look at lsp mappings help and eventually use more of it
-- [ ]. USE TELESCOPE BECAUSE IT IS TOO POWERFULL
--      NB. telescope themes can be applied to single commands and to `.setup()`
-- [ ]. add more plugins maybe(?)
