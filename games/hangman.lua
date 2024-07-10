--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 10 2024
  last update: july 10 2024
]]

local hangman = {}
utilities = require("modules.utilities")
get_os = require("modules.get_os")

function set_word(words)
  local sel_word = words[utilities.generate_number(1, #words)]
  local x = ""
  for i = 1, #sel_word do
    x = x .. "_"
  end
  return {sel_word, x}
end
           
function load_game(word)
  local phrase = set_word(word)
  play(phrase[1], phrase[2])
end

function play(word, dashes)
  if #word > 4 then
    local hint = utilities.generate_number(1, #word)
    print("the hint is "..string.sub(word, hint, hint))
  end
  for i = 1, #word do
    while string.lower(string.sub(word, i, i)) ~= string.lower(string.sub(dashes, i, i)) do 
      print(dashes)
      local guess = io.read()
      if string.lower(string.sub(word, i, i)) == string.lower(string.sub(guess, 1, 1)) then 
        print("you got it correct")
        if i < #word then
          dashes = string.sub(dashes, 1, i-1) .. string.lower(string.sub(guess, 1, 1)) .. string.sub(dashes, i+1, #dashes)
        else
          dashes = string.sub(dashes, 1, i-1) .. string.lower(string.sub(guess, 1, 1))
        end  
      else
        print("you got it wrong")
      end
    end
  end
  os.execute("sleep 2")
  get_os.clear_scrn()
end

function hangman.main()
  local word = utilities.get_data("./modules/1000_words.txt")
  while true do
    print("1. new game")
    print("0. exit")
    print("enter your choice")
    local mychoice = io.read()
    if mychoice == "1" then
      os.execute("sleep 2")
      get_os.clear_scrn()
      load_game(word)
    else
      print("exiting ...")
      print("thank you for playing")
      os.execute("sleep 3")
      get_os.clear_scrn()
      return
    end
  end
end

return hangman