local util = require('util')

local custom_attach = function(client)
    print("LSP started");

    -- require'completion'.on_attach(client);

    util.map('n', '<leader>vd',  '<cmd>lua vim.lsp.buf.definition()<cr>', util.default_opts);                        -- view definition
    util.map('n', '<leader>vD',  '<cmd>lua vim.lsp.buf.declaration()<cr>', util.default_opts);                       -- view declaration
    util.map('n', 'K',           '<cmd>lua require("lspsaga.hover").render_hover_doc()<cr>', util.default_opts);                             -- view hover info
    util.map('n', '<C-f>',       '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<cr>', util.default_opts);                             -- view hover info
    util.map('n', '<C-b>',       '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<cr>', util.default_opts);                             -- view hover info
    util.map('n', '<leader>vi',  '<cmd>lua vim.lsp.buf.implementation()<cr>', util.default_opts);                    -- view implementation
    util.map('n', '<leader>vr',  '<cmd>Telescope lsp_references<cr>', util.default_opts);                            -- view references
    util.map('n', '<leader>rn',  '<cmd>lua vim.lsp.buf.rename()<cr>', util.default_opts);                            -- rename all references
    util.map('n', '<leader>vs',  '<cmd>lua vim.lsp.buf.signature_help()<cr>', util.default_opts);                    -- view symbol signature normal mode
    util.map('i', '<C-h>',       '<cmd>lua vim.lsp.buf.signature_help()<cr>', util.default_opts);                    -- view symbol signature insert mode
    util.map('n', '<leader>vt',  '<cmd>lua vim.lsp.buf.type_definition()<cr>', util.default_opts);                   -- view type definition
    util.map('n', '<leader>ca',  '<cmd>Telescope lsp_code_actions<cr>', util.default_opts);                          -- do a code action

    util.map('n', '<leader>dd',  '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>', util.default_opts);      -- view line diagnostics
    util.map('n', '<leader>dn',  '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', util.default_opts);                  -- go to  next diagnostic
    util.map('n', '<leader>dp',  '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', util.default_opts);                  -- go to previous diagnostic

end

local nvim_lsp = require('lspconfig')
local saga = require('lspsaga')
saga.init_lsp_saga()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.rust_analyzer.setup {
    capabilities = capabilities,
}

-- start language servers
local servers = {"clangd", "pyright"}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = custom_attach,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end


-- local home = os.getenv('HOME')

-- nvim_lsp.pyright.setup{
--     on_attach = custom_attach,
--     -- root_dir = function(fname)
--     --     local root_files = {
--     --         'setup.py',
--     --         'pyproject.toml',
--     --         'setup.cfg',
--     --         'requirements.txt',
--     --         'Pipfile',
--     --         'pyrightconfig.json',
--     --     }
--     --     return util.root_pattern(unpack(root_files))(fname) or util.find
--     -- end
-- }


-- configure lua lsp
-- local systemname
-- if vim.fn.has("mac") == 1 then
--     systemname = "macOS"
-- elseif vim.fn.has("unix") == 1 then
--     systemname = "Linux"
-- elseif vim.fn.has("win32") == 1 then
--     systemname = "Windows"
-- end
-- 
-- local sumneko_root_path = '/usr/local/src/lua-language-server'
-- local sumneko_binary = sumneko_root_path..'/bin/'..systemname..'/lua-language-server'
-- 
-- nvim_lsp.sumneko_lua.setup{
--     on_attach = custom_attach,
--     cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = vim.split(package.path, ';'),
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {'vim'},
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = {
--                     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                     [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--                 },
--             },
--             telemetry = {
--                 enable = false
--             },
--         },
--     },
-- }
