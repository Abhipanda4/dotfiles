local nvim_lsp = require('nvim_lsp')

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local available_servers = [ 'pyls' ]
for _, server in ipairs(available_servers) do
    nvim_lsp[server].setup {
        on_attach = on_attach
    }
end
