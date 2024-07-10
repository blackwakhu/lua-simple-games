--[[
  @author: Derrick Wakhu Shibero
  first pub date: july 10 2024
  last update: july 10 2024
]]

local hangman = {}
utilities = require("modules.utilities")

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
  print(word)
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
end

function hangman.main()
  print("welcome to hangman")
  local word = utilities.get_data("./modules/1000_words.txt")
  load_game(word)
end

return hangman