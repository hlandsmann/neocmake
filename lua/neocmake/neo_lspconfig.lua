local neo_lspconfig = {}
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

neo_lspconfig.setup_clangd = function(compile_commands_dir)
  local setup = {
    cmd = {
      'clangd',
      "--all-scopes-completion",
      "--completion-style=detailed",
      "--pch-storage=memory",
      '--background-index',
      '--log=verbose'
    },
    capabilities = capabilities,
  }
  if compile_commands_dir ~= nil then
    table.insert(setup.cmd, "--compile-commands-dir=" .. compile_commands_dir)
  end
  lspconfig.clangd.setup(setup)
end

return neo_lspconfig
