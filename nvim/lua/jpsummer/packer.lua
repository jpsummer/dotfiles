-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd("packadd packer.nvim")

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'ThePrimeagen/vim-be-good'

    -- colorscheme tokyonight
    use 'folke/tokyonight.nvim'

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
        'w0rp/ale',
        ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
        cmd = 'ALEEnable',
        config = 'vim.cmd[[ALEEnable]]'
    }

    -- Plugins can have post-install/update hooks
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use { -- Status Line
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'                            -- Configurations for Nvim LSP
    use 'onsails/lspkind-nvim'                             -- vscode-like pictograms for LSP
    use 'hrsh7th/cmp-buffer'                               -- nivm-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp'                             -- nvim-cmp source for neovim's built in LSP
    use 'hrsh7th/nvim-cmp'                                 -- auto-completion
    use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" }) -- Snippet Engine
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use "windwp/nvim-autopairs"
    use 'windwp/nvim-ts-autotag'
    use 'mfussenegger/nvim-jdtls' -- java language server

    -- Fuzzy Finder
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Nice Looking Tabs
    -- use 'akinsho/nvim-bufferline.lua'

    -- Colorizer
    use 'norcalli/nvim-colorizer.lua'

    -- Prettier
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    vim.cmd([[
      augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
      augroup end
    ]])
end)
