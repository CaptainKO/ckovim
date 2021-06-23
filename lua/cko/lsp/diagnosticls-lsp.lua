
local config = require"lspinstall/util".extract_config("diagnosticls")

local cmd = DATA_PATH .. "/lspinstall/diagnosticls/node_modules/.bin/diagnostic-languageserver"
config.default_config.cmd[1] = cmd

-- require'lspinstall/servers'.diagnosticls = vim.tbl_extend('error', config , {})
