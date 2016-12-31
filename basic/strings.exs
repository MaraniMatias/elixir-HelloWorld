IO.puts <<104,101,108,108,111>> # "hello" <<bytes>>

IO.puts is_list('Example')          # true
IO.puts is_list("Example")          # false
IO.puts is_binary("Example")        # true
IO.puts <<"Example">> === "Example" # true

# Char Lists
char_list = 'hello'
# [hd|tl] = char_list
# IO.puts {hd, tl} # {104, 'ello'}

Enum.reduce(char_list, "", fn char, acc -> 
  acc <> to_string(char) <> ","
end) # "104,101,108,108,111,"

# Graphemes and Codepoints
string = "\u0061\u0301" # "á"
IO.puts String.codepoints string # ["a", "'"]
IO.puts String.graphemes string  # ["á"]

# String Functions
# http://elixir-lang.org/docs/stable/elixir/String.html
IO.puts String.length "Hello"             # 5
IO.puts String.replace("Hello", "e", "a") # "Hallo"
IO.puts String.replace "Hello", "e", "a"  # "Hallo"

IO.puts String.duplicate("Oh my ", 3)     # "Oh my Oh my Oh my "
IO.puts String.split("Hello World", " ")  # ["Hello", "World"]
