-- vim.g.EasyMotion_do_shade = true
vim.api.nvim_exec([[
      augroup EasyMotionCoC
            autocmd!
            autocmd User EasyMotionPromptBegin silent! CocDisable
            autocmd User EasyMotionPromptEnd silent! CocEnable
      augroup END
]], false)
