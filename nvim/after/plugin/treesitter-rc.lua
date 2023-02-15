local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
        disable = { "html" },
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'tsx',
        'typescript',
        'javascript',
        'lua',
        'json',
        'css',
        'html',
        'python'
    },
    autotag = {
        enable = true,
    }
}
