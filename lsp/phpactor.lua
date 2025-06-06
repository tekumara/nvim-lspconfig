local util = require 'lspconfig.util'

---@brief
---
---https://github.com/phpactor/phpactor
--
-- Installation: https://phpactor.readthedocs.io/en/master/usage/standalone.html#global-installation
return {
  cmd = { 'phpactor', 'language-server' },
  filetypes = { 'php' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local cwd = vim.uv.cwd()
    local root = util.root_pattern('composer.json', '.git', '.phpactor.json', '.phpactor.yml')(fname)

    -- prefer cwd if root is a descendant
    on_dir(util.path.is_descendant(cwd, root) and cwd or root)
  end,
}
