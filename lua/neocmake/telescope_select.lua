local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"

local telescope_select = {}


telescope_select.choice = function(title, choice, lambda_apply, opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = title,
    finder = finders.new_table {
      results = choice
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- print(vim.inspect(selection))
        lambda_apply(selection[1])
      end)
      return true
    end,
  }):find()
end

telescope_select.cmake_build_presets = function(lambda_apply, configure_presets)

end

return telescope_select
