--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 9 2024
  last update: july 10 2024
]]

local guessgames = {}
get_os = require("modules.get_os")
utilities = require("modules.utilities")

-- the functions for number generator
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
  print("You choose Number guessor")
  local min = getMin()
  local max = getMax()
  local points = 0
  while true do
    local number = utilities.generate_number(min, max)
    local guess = number_guessor_prompt(min, max)
    os.execute("sleep 2")
    if guess == nil then
      print("You have "..points.." point(s)")
      print("exiting ...")
      get_os.clear_scrn()
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

-- the functions for rock paper scissors
function generate_item()
  local data = {"rock", "paper", "scissors"}
  return data[utilities.generate_number(1, #data)]
end

function get_user_rps_input()
  print("enter either rock, paper, or scissors")
  local input = io.read()
  if input:lower() == "rock" then
    return "rock"
  elseif input:lower() == "paper" then
    return "paper"
  elseif input:lower() == "scissors" then
    return "scissors"
  else
    return nil
  end
end

function guessgames.rock_paper_scissors()
  print("You choose Rock Paper Scissors")
  local score = 0
  while true do
    local user_input = get_user_rps_input()
    local cpu_input = generate_item()
    os.execute("sleep 2")
    if user_input == nil then
      print("You have "..score.." point(s)")
      print("exiting ...")
      get_os.clear_scrn()
      return
    end
    print("the cpu generated "..cpu_input)
    if user_input == cpu_input then
      score = score + 2
      print("draw you scored 2")
    elseif user_input == "rock" and cpu_input == "scissors"  or user_input == "paper"  and cpu_input == "rock" or user_input == "scissors" and cpu_input == "paper" then
      score = score + 4
      print("win you scored 4")
    else
      print("you lose")
    end
    os.execute("sleep 3")
  end
end

return guessgames