IO.puts <<104,101,108,108,111>> # "hello" <<bytes>>

IO.puts is_list('Example')          # true
IO.puts is_list("Example")          # false
IO.puts is_binary("Example")        # true
IO.puts <<"Example">> === "Example" # true

IO.puts List.to_string('elixir')              # "elixir"
IO.puts String.to_char_list("elixir") #'elixir'

pass_through = ~S"This is a {#msg}, she said.\n  This is only a {#msg}."
IO.puts pass_through
#  s (for binary string)
#  c (for character list)
#  r (for regular expression)
#  w (to produce a list split into words by whitespace).
IO.puts ~w/Elixir is great!/ # ["Elixir", "is", "great!"]

# Char Lists
char_list = 'hello'
# [hd|tl] = char_list
# IO.puts {hd, tl} # {104, 'ello'}

# @@@ Warning @@@
# Character lists are slower to work with and take up 
# more memory than strings, so they shouldn’t be your first choice

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

a = "ir"
b = "elix#{a}"
IO.puts b
a = "ir-2"
IO.puts b

y = {4, 5, 6}
IO.puts "y is now #{inspect y}"

ms = """Hi,
I am 
Multiline Strings
"""
IO.puts ms
