local neocmake = require("neocmake")

vim.api.nvim_create_user_command(
  "NeoCMakeSelectBuildPreset",
  neocmake.select_build_preset,
  {
    nargs = 0,
    desc = "Select CMake Build Preset",
  }
)
