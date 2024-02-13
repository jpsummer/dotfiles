local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup {
    on_attach = function(client, bufnr)
        -- formatting
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[
                augroup Format
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                augroup END
            ]])
        end
    end,
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
        null_ls.builtins.diagnostics.zsh
    }
}
