--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 10 2024
  last update: july 10 2024
]]

local bastest = {}
get_os = require("modules.get_os")

function bastest.main()
  print("welcome to the game")
  print("1. new game")
  print("2. instructions")
  print("3. settings")
  print("0. exit")
  print("enter your choice")
  local choice = io.read()
  if choice == "1" then
    load_game()
  end
end

function print_screen(screen)
  for i = 1, #screen do
    local txt = ""
    for x = 1, #screen[i] do
      txt = txt .. screen[i][x]
    end
    print(txt)
  end
end

function load_game()
  get_os.clear_scrn()
  local screen = create_screen()
  print_screen(screen)
  os.execute("sleep 2")
end

function create_screen()
  local scrn = {}
  for i = 1, 15 do
    scrn[i] = {}
    scrn[i][1] = "|"
    for x = 2, 39 do
      scrn[i][x] = " "
    end
    scrn[i][40] = "|"
  end
  scrn[16] = {}
  for i = 1, 40 do
    scrn[16][i] = "-"
  end
  return scrn
end
return bastest