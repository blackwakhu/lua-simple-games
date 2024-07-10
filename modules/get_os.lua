--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 10 2024
  last update: july 10 2024
]] 

local get_os = {}

function get_os.getName()
  local osname
  -- ask LuaJIT first
  if jit then
    return jit.os
  end

  -- Unix, Linux variants
  local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
  if fh then
    osname = fh:read()
  end

  return osname or "Windows"
end

function get_os.clear_scrn()
  if get_os.getName() == "Windows" then
    os.execute("cls")
  end
  os.execute("clear")
end

return get_os