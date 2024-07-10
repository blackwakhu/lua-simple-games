--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 9 2024
  last update: july 9 20244
]]

guessgames = require("guessgames")
print("Welcome to the simple games program")

function menu()
  print("main menu")
  print("1. Number Guessor")
  print("2. Rock Paper Scissors")
  print("0. Exit")
  print("Enter your choice:")
  local choice = io.read()
  if choice == "1" then
    guessgames.number_guessor()
    menu()
  elseif choice == "2" then 
    guessgames.rock_paper_scissors()
    menu()
  elseif choice == "0" then
     print("exiting...")
  else
     print("exiting...")
  end
end

-- the main menu where it all begins
menu()

