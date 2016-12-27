# Char List
IO.puts ~c/2 + 7 = #{2 + 7}/ # '2 + 7 = 9'
IO.puts ~C/2 + 7 = #{2 + 7}/ # '2 + 7 = #{2 + 7}'

# Regular Expressions
re = ~r/elixir/
IO.puts "Elixir" =~ re  # false
IO.puts "elixir" =~ re  # true

rei = ~r/elixir/i
IO.puts "Elixir" =~ re  # true
IO.puts "elixir" =~ re  # true

string = "100_000_000"
IO.puts Regex.split(~r/_/, string) # ["100", "000", "000"]

# String
IO.puts ~s/welcome to elixir #{String.downcase "SCHOOL"}/ # "welcome to elixir school"
IO.puts ~S/welcome to elixir #{String.downcase "SCHOOL"}/ # "welcome to elixir \#{String.downcase \"school\"}"

# Word List
IO.puts ~w/i love #{'e'}lixir school/ # ["i", "love", "elixir", "school"]
IO.puts ~W/i love #{'e'}lixir school/ # ["i", "love", "\#{'e'}lixir", "school"]

# NaiveDateTime
# native = ~N[2000-01-01 23:00:07]
# IO.ptus native.year   # 2000
# IO.puts naive.second  # 7
# http://elixir-lang.org/docs/stable/elixir/NaiveDateTime.html

# Creating Sigils
defmodule MySigils do
  def sigil_u(string, []), do: String.upcase(string)
end
IO.puts import MySigils   # nil
IO.puts ~u/elixir school/ # ELIXIR SCHOOL

