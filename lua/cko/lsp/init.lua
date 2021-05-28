nvim_lsp = require'lspconfig'
-- require'lspinstall'.setup()
-- TODO figure out why this don't work
vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

-- vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
-- vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
-- vim.cmd("nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>")
-- vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")
-- vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
-- vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")
-- -- vim.cmd('nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>')
-- vim.cmd("nnoremap <silent> <C-p> :Lspsaga diagnostic_jump_prev<CR>")
-- vim.cmd("nnoremap <silent> <C-n> :Lspsaga diagnostic_jump_next<CR>")
-- -- scroll down hover doc or scroll in definition preview
-- vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
-- -- scroll up hover doc
-- vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
-- vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = true,
    underline = true,
  }
)

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        -- vim.api.nvim_exec( [[
        --   ""hi LspReferenceRead cterm=bold ctermbg=red
        --   ""hi LspReferenceText cterm=bold ctermbg=red
        --   ""hi LspReferenceWrite cterm=bold ctermbg=red
        --   ""hi LspDiagnosticsVirtualTextError cterm=bold ctermbg=red
        --   ""hi LspDiagnosticsVirtualTextWarning cterm=bold ctermbg=orange
        --   ""hi LspDiagnosticsVirtualTextInformation cterm=bold cter
        --   ""hi LspDiagnosticsVirtualTextHint
        --   ""augroup lsp_document_highlight
        --     ""autocmd! * <buffer>
        --     ""autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --     ""autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --   ""augroup END
      -- ]], false)
    end
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.common_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end

DATA_PATH = vim.fn.stdpath('data')
local angular_config = require"lspinstall/util".extract_config("angularls")
local angular_path = DATA_PATH .. "/lspinstall/angularls/node_modules"

local angular_cmd = {
  angular_path .. "/@angular/language-server/bin/ngserver",
  "--stdio",
  "--tsProbeLocations",
  angular_path,
  "--ngProbeLocations",
  angular_path,
}

angular_config.default_config.cmd = angular_cmd;

angular_config.default_config.on_new_config = function(new_config, new_root_dir)
  new_config.cmd = angular_cmd
end

require'lspinstall/servers'.angularls = vim.tbl_extend('error', angular_config, {
  install_script = [[
    ! test -f package.json && npm init -y --scope=lspinstall || true
    npm install typescript @angular/language-server@latest @angular/language-service@latest
  ]],
})
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      on_attach = lsp_config.common_on_attach
    }
  end
end

vim.lsp.set_log_level("debug")
setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

return lsp_config
