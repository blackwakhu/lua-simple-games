local guessgames = {}

function generate_number(min, max)
  return math.random(min, max)
end

function number_guessor_prompt(min, max)
  print("Enter a number between "..min.." and "..max.." (or 'exit' to exit)")
  local input = io.read()
  if input:lower() == "exit" then
    return nil
  end
  return tonumber(input)
end

function getMin()
  print("Enter the minimum number:")
  return tonumber(io.read())
end

function getMax()
  print("Enter the max number")
  return tonumber(io.read())
end

function guessgames.number_guessor()
  local min = getMin()
  local max = getMax()
  local points = 0
  while true do
    local number = generate_number(min, max)
    local guess = number_guessor_prompt(min, max)
    os.execute("sleep 2")
    if guess == nil then
      print("You have "..points.." point(s)")
      print("exiting ...")
      return
    elseif number == guess then
      print("You got it correct...")
      points = points + 1
    else
      print("You did not get it")
    end
    os.execute("sleep 3")
  end
end

return guessgames