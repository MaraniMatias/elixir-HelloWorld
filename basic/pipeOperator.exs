# Pipe Operator
# The pipe operator |> passes the result of an expression as the first parameter of another expression.

# foo(bar(baz(nueva_function(otra_function()))))                  # bad :(
# otra_function() |> nueva_function() |> baz() |> bar() |> foo()  # Good :)

"Elixir language" |> String.split                                 # ["Elixir", "language"]
"Elixir language" |> String.split |> Enum.map( &String.upcase/1 ) # ["ELIXIR", "LANGUAGE"]
"elixir" |> String.ends_with?("ixir") |> IO.puts                  # true
# "elixir" |> String.ends_with? "ixir"                              # true
