local Plug = vim.fn['plug#']

-- Plugins will be downloaded under the specified directory.
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Declare the list of plugins.
--Plug 'tpope/vim-sensible'
Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.0' })
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'vimwiki/vimwiki'

-- List ends here. Plugins become visible to Vim after this call.
vim.call('plug#end')

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.keymap.set('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')

vim.o.number = true

require('lualine').setup {
	options = { theme = 'gruvbox_dark', },
}
