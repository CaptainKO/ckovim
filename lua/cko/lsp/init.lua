local lspconfig = require'lspconfig'
local lsp_util = lspconfig.util

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
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end
require('cko.lsp.angular-lsp')
require('cko.lsp.js-ts-lsp')
require('cko.lsp.diagnosticls-lsp')

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
   local config = {}

    if server == "angularls" then
      config = {
        root_dir= lsp_util.root_pattern("angular.json"),
      }
    end

    if server == "tsserver" then
      config = {
        root_dir= lsp_util.root_pattern("tsconfig*.json"),
      }
    end

    if server == "efm" then
      -- Formatting via efm
      local prettier = require "cko.lsp.efm.prettier"
      local eslint = require "cko.lsp.efm.eslint"
      local luafmt = require "cko.lsp.efm.luafmt"
      local rustfmt = require "cko.lsp.efm.rustfmt"
      -- local autopep = require "efm/autopep8"

      local languages = {
          lua = {luafmt},
          typescript = {prettier, eslint},
          javascript = {prettier, eslint},
          typescriptreact = {prettier, eslint},
          javascriptreact = {prettier, eslint},
          yaml = {prettier},
          json = {prettier},
          -- html = {prettier},
          scss = {prettier},
          css = {prettier},
          markdown = {prettier},
          rust = {rustfmt}
          -- python = {autopep}
      }

      config = {
          root_dir = lspconfig.util.root_pattern(
                "package.json",
                ".eslintrc*",
                "*prettierrc*"
          ),
---@diagnostic disable-next-line: undefined-global
          filetypes = vim.tbl_keys(languages),
          init_options = {documentFormatting = true, codeAction = true},
          settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
          -- on_attach = on_attach
      }

      dump(languages.typescript[1])
      -- inspect(config)
    end

    if server == "diagnosticls" then
      config = {
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', },
        init_options = {
          linters = {
            eslint = {
               command = './node_modules/.bin/eslint',
               args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
               debounce = 100,
               sourceName = 'eslint',
               rootPatterns= {
                ".eslintrc.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
                ".eslintrc.yml",
                ".eslintrc.yml",
                -- "package.json"
              },
               parseJson = {
                 errorsRoot = '[0].messages',
                 line = 'line',
                 column = 'column',
                 endLine = 'endLine',
                 endColumn = 'endColumn',
                 message = '[eslint] ${message} [${ruleId}]',
                 security = 'severity'
               },
               securities = {
                 [2] = 'error',
                 [1] = 'warning'
               }
             },
          },
          filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
            markdown = 'markdownlint',
            pandoc = 'markdownlint'
          },
         formatters = {
           -- prettierEslint = {
           --   command = 'prettier-eslint',
           --   args = { '--stdin' },
           --   rootPatterns = { '.git' },
           -- },
           prettier = {
              debounce = 100,
              -- sourceName = 'prettier',
              command = './node_modules/.bin/prettier',
              args = { '--stdin-filepath', '%filename' },
              rootPatterns = {
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.toml",
                ".prettierrc.json",
                ".prettierrc.yml",
                ".prettierrc.yaml",
                ".prettierrc.json5",
                ".prettierrc.js",
                ".prettierrc.cjs",
                "prettier.config.js",
                "prettier.config.cjs"
             },
           }
         },
         -- formatFiletypes = {
         --    css = 'prettier',
         --    javascript = 'prettierEslint',
         --    javascriptreact = 'prettierEslint',
         --    json = 'prettier',
         --    scss = 'prettier',
         --    typescript = 'prettier',
         --    typescriptreact = 'prettierEslint'
         --  }

        }
      }

    end

    lspconfig[server].setup(config)

  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- nvim_lsp.diagnosticls.setup{
--   -- on_attach=custom_attach,
--   filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'scss', 'markdown', 'pandoc' },
--   init_options = {
--     linters = {
--       eslint = {
--         command = './node_modules/eslint/bin/eslint',
--         args= { "--stdin-filepath", "%filepath" },
--          rootPatterns = { ".prettierrc",
--         ".prettierrc.json",
--         ".prettierrc.toml",
--         ".prettierrc.json",
--         ".prettierrc.yml",
--         ".prettierrc.yaml",
--         ".prettierrc.json5",
--         ".prettierrc.js",
--         ".prettierrc.cjs",
--         "prettier.config.js",
--         "prettier.config.cjs"
--         },
--         debounce = 100,
--         args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
--         sourceName = 'eslint',
--         parseJson = {
--           errorsRoot = '[0].messages',
--           line = 'line',
--           column = 'column',
--           endLine = 'endLine',
--           endColumn = 'endColumn',
--           message = '[eslint] ${message} [${ruleId}]',
--           security = 'severity'
--         },
--         securities = {
--           [2] = 'error',
--           [1] = 'warning'
--         }
--       },
--       markdownlint = {
--         command = 'markdownlint',
--         rootPatterns = { '.git' },
--         isStderr = true,
--         debounce = 100,
--         args = { '--stdin' },
--         offsetLine = 0,
--         offsetColumn = 0,
--         sourceName = 'markdownlint',
--         securities = {
--           undefined = 'hint'
--         },
--         formatLines = 1,
--         formatPattern = {
--           '^.*:(\\d+)\\s+(.*)$',
--           {
--             line = 1,
--             column = -1,
--             message = 2,
--           }
--         }
--       }
--     },
--     filetypes = {
--       javascript = 'eslint',
--       javascriptreact = 'eslint',
--       typescript = 'eslint',
--       typescriptreact = 'eslint',
--       markdown = 'markdownlint',
--       pandoc = 'markdownlint'
--     },
--     formatters = {
--       prettierEslint = {
--         command = 'prettier-eslint',
--         args = { '--stdin' },
--         rootPatterns = { '.git' },
--       },
--       prettier = {
--         command = 'prettier',
--         args = { '--stdin-filepath', '%filename' }
--       }
--     },
--     formatFiletypes = {
--        css = 'prettier',
--        javascript = 'prettierEslint',
--        javascriptreact = 'prettierEslint',
--        json = 'prettier',
--        scss = 'prettier',
--        typescript = 'prettierEslint',
--        typescriptreact = 'prettierEslint'
--     }
--   }
-- }
-- -- require'lspinstall'.setup()
-- -- for the last
-- -- local function setup_servers()
-- --   local servers = require'lspinstall'.installed_servers()
-- --   for _, server in pairs(servers) do
-- --     require'lspconfig'[server].setup{
-- --       -- on_attach = lsp_config.common_on_attach
-- --     }
-- --   end
-- -- end

-- vim.lsp.set_log_level("debug")
-- setup_servers()
--
---- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require'lspinstall'.post_install_hook = function ()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end
--local lsp_config = {}
--
--function lsp_config.common_on_attach(client, bufnr)
    --documentHighlight(client, bufnr)
--end
--
--function lsp_config.tsserver_on_attach(client, bufnr)
    --lsp_config.common_on_attach(client, bufnr)
    --client.resolved_capabilities.document_formatting = false
--end
--
---- Use a loop to conveniently both setup defined servers
---- and map buffer local keybindings when the language server attaches
---- local servers = {"pyright", "tsserver"}
---- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
--
--DATA_PATH = vim.fn.stdpath('data') local angular_config = require"lspinstall/util".extract_config("angularls")
--local angular_path = DATA_PATH .. "/lspinstall/angularls/node_modules"
--
--local angular_cmd = {
  --angular_path .. "/@angular/language-server/bin/ngserver",
  --"--stdio",
  --"--tsProbeLocations",
  --angular_path,
  --"--ngProbeLocations",
  --angular_path,
--}
--
--angular_config.default_config.cmd = angular_cmd;
--
--angular_config.default_config.on_new_config = function(new_config, new_root_dir)
  --new_config.cmd = angular_cmd
--end
--
--require'lspinstall/servers'.angularls = vim.tbl_extend('error', angular_config, {
  --install_script = [[
    --! test -f package.json && npm init -y --scope=lspinstall || true
    --npm install typescript @angular/language-server@latest @angular/language-service@latest
  --]],
--})
--local function setup_servers()
  --require'lspinstall'.setup()
  --local servers = require'lspinstall'.installed_servers()
  --for _, server in pairs(servers) do
    --require'lspconfig'[server].setup{
      --on_attach = lsp_config.common_on_attach
    --}
  --end
--end
--
--vim.lsp.set_log_level("debug")
--setup_servers()
--
---- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
--require'lspinstall'.post_install_hook = function ()
  --setup_servers() -- reload installed servers
  --vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
--end
--
--return lsp_config
