# Evaluation
IO.puts EEx.eval_string "Hi, <%= name %>", [name: "Sean"] # "Hi, Sean"

# Definitions
# greeting.eex
Hi, <%= name %>
defmodule Example do
  require EEx
  EEx.function_from_file :def, :greeting, "greeting.eex", [:name]
end
IO.puts Example.greeting("Sean") # "Hi, Sean"

# Engine
IO.puts EEx.eval_string "Hi, <%= @name %>", assigns: [name: "Sean"] # "Hi, Sean"
