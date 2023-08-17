local util = require 'neocmake.util'
local cmake_presets = {}

cmake_presets.get_filename = function(workspace_dir)
  local user_presets_fn = workspace_dir .. "/CMakeUserPresets.json"
  local presets_fn = vim.fn.getcwd() .. "/CMakePresets.json"
  if util.file_exists(user_presets_fn) then
    return user_presets_fn
  elseif util.file_exists(presets_fn) then
    return presets_fn
  else
    print("CMake[User]Presets" .. " does not exist!")
    return nil
  end
end

cmake_presets.get_cmake_presets = function(workspace_dir)
  local cmake_presets_fn = cmake_presets.get_filename(workspace_dir)
  if not cmake_presets_fn then
    return
  end
  return util.get_json(cmake_presets_fn)
end

cmake_presets.get_configurePresets = function(workspace_dir)
  local presets = cmake_presets.get_cmake_presets(workspace_dir)
  if presets == nil then return nil end
  return presets.configurePresets
end

return cmake_presets
