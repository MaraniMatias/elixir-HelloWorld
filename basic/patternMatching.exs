# Match Operator
IO.puts x = 1 # 1
IO.puts 1 = x # 1
#IO.puts 2 = x # ** (MatchError) no match of right hand side value: 1

# list
IO.puts list = [1, 2, 3]
IO.puts [1, 2, 3] = list # [1, 2, 3]
# IO.puts [] = list # ** (MatchError) no match of right hand side value: [1, 2, 3]

[1|tail] = list # [1, 2, 3]
IO.puts tail # [2, 3]
# IO.puts [2|_] = list #  ** (MatchError) no match of right hand side value: [1, 2, 3]

# tuples
IO.puts {:ok, value} = {:ok, "Successful!"} # {:ok, "Successful!"}
IO.puts value # "Successful!"
# IO.puts {:ok, value} = {:error} # ** (MatchError) no match of right hand side value: {:error}

# Pin Operator
# Evita que se remplace el valor al usar el operado =
IO.puts x = 1 # 1
#  ^x = 2     # ** (MatchError) no match of right hand side value: 2
IO.puts {x, ^x} = {2, 1} # {2, 1}
IO.puts x     # 2

IO.puts key = "hello" # "hello"
IO.puts %{^key => value} = %{"hello" => "world"} # %{"hello" => "world"}
IO.puts value # "world"
IO.puts %{^key => value} = %{:hello => "world"} # ** (MatchError) no match of right hand side value: %{hello: "world"}

greeting = "Hello"
greet = fn
  (^greeting, name) -> "#{greeting} Hi #{name}"
  (greeting, name) -> "#{greeting}, #{name}"
end
#Function<12.54118792/2 in :erl_eval.expr/5>
IO.puts greet.("Hello", "Sean")   # "Hi Sean"
IO.puts greet.("Mornin'", "Sean") # "Mornin', Sean"

