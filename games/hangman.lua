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
  print(x.." starts with "..string.sub(sel_word, 1, 1))
  return {sel_word, x}
end

function load_game()
end

function play()
end

function hangman.main()
  print("welcome to hangman")
  local word = utilities.get_data("./modules/1000_words.txt")
  local phrase = set_word(word)
end

return hangman