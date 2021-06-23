
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

-- require'lspconfig'.angularls.setup {
--  cmd = angular_cmd,
--   on_new_config = function(new_config, new_root_dir)
--   new_config.cmd = angular_cmd
--   end
-- }

