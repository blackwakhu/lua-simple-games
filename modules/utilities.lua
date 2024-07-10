--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 10 2024
  last update: july 10 2024
]]

utilities = {}

function utilities.generate_number(min, max)
  return math.random(min, max)
end

function utilities.get_data(filepath)
  local wrd = {}
  local file = io.open(filepath, "r")
  if file then
    for line in file:lines() do
      table.insert(wrd, line)
    end
    file:close()
  else
    print("error in opening file")
  end
  return wrd
end

return utilities