guessgames = require("guessgames")
print("Welcome to the simple games program")

function menu()
  print("main menu")
  print("1. Number Guessor")
  print("0. Exit")
  print("Enter your choice:")
  local choice = io.read()
  if choice == "1" then
     guessgames.number_guessor()
  elseif choice == "0" then
     print("exiting")
  else
     print("exiting")
  end
end


