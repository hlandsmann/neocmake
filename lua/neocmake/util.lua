local util = {}

util.file_exists = function(fname)
  local f = io.open(fname, "r")
  if f ~= nil then
    io.close(f)
    return true
  else return false end
end

util.get_json = function(json_fn)
  local f = assert(io.open(json_fn, "r"))
  local content = f:read("*all")
  f:close()
  return vim.json.decode(content)
end

return util
