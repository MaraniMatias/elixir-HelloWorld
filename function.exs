# https://workingdevblog.wordpress.com/2016/08/25/trader-app-hello-elixir/
# https://elixirschool.com/lessons/basics/functions/

# Anonymous Functions
add = fn a, b -> a + b end
sum = &(&1 + &2)

IO.puts is_function(add) # true
IO.puts add.(4, 5) # 9

IO.puts is_function(sum) # true
IO.puts sum.(5,4) # 9

# Pattern Matching
handle_result = fn
  {:ok, result} ->
    IO.puts "Handling result..."
  {:error} ->
    IO.puts "An error has occurred!"
end

some_result = 1
handle_result.({:ok, some_result}) #  Handling result...
handle_result.({:error}) #  An error has occurred!

# Named Functions

