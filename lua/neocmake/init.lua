local cmake_presets = require'neocmake.cmake_presets'
NeoCMake = {
  terminal = nil,
  selected_build_preset = nil,
  configurePresets = nil,
  workspace_dir = nil,
}

NeoCMake.new = function(workspace_dir)
  local self = NeoCMake
  self.workspace_dir = workspace_dir or vim.fn.getcwd()
  self.configurePresets = cmake_presets.get_cmake_presets(self.workspace_dir)
  return self
end

local obj = nil
NeoCMake.get = function()
  if obj ~= nil then return obj end
  obj = NeoCMake.new()
  return obj
end

function NeoCMake:set_workspace_dir(workspace_dir)
  self = NeoCMake.new(workspace_dir)
end

function NeoCMake:set_build_preset(selected_build_preset)
  self.selected_build_preset = selected_build_preset
end

-- function NeoCMake.setup(values) end


function NeoCMake.select_build_preset()
  local self = NeoCMake.get()
  if self.workspace_dir == nil then
    print("hello neocmake")
  else
    print("neocmake from " .. self.workspace_dir)
  end
end

return NeoCMake
