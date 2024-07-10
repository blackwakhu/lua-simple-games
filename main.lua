--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 9 2024
  last update: july 10 20244
]]

guessgames = require("games.guessgames")
get_os = require("modules.get_os")
bastest = require("games.bastest")
print("Welcome to the simple games program")

function menu()
  print("main menu")
  print("1. Number Guessor")
  print("2. Rock Paper Scissors")
  print("3. Bastest")
  print("0. Exit")
  print("Enter your choice:")
  local choice = io.read()
  get_os.clear_scrn()
  if choice == "1" then
    guessgames.number_guessor()
    menu()
  elseif choice == "2" then
    guessgames.rock_paper_scissors()
    menu()
  elseif choice == "3" then
    bastest.main()
    menu()
  elseif choice == "0" then
     print("exiting...")
  else
     print("exiting...")
  end
end

-- the main menu where it all begins
menu()

