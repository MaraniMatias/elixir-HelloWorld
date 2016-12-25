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
defmodule Greeter do
  def hello(name) do
   "Hello, " <> name #join
  end
  def hello2(name), do: "Hello2, " <> name
end

IO.puts Greeter.hello("Matias")
IO.puts Greeter.hello2("Matias")

# Recursion
defmodule Length do
  def of([]), do: 0
  def of([_|t]), do: 1 + of(t)
end

IO.puts Length.of []        # 0
IO.puts Length.of [1, 2, 3] # 3

# Function Naming and Arity
defmodule Generate do
  # Hello/0
  def hello(), do: "Hola."
  # Hello/1
  def hello(name), do: "Hola " <> name
  # Hello/2
  def hello(name,surname), do: "Hola #{name}  #{surname}"
end

IO.puts Generate.hello()
IO.puts Generate.hello("Matias")
IO.puts Generate.hello("Romina","Marani")

# Private Functions
defmodule Func do
  def hello(name), do: phrase <> name
  defp phrase, do: "Hello, "
end

IO.puts Func.hello("Sean") # "Hello, Sean"

# Guards
defmodule Guards do
  # Private
  defp hello, do: "Hola, "
  # fn/1 not list
  def fnc(name) when is_binary(name) do
    hello <> name
  end
  # fn/1 with list
  def fnc(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> fnc
  end
end

IO.puts Guards.fnc ["Sean", "Steve"] # "Hello, Sean, Steve"
IO.puts Guards.fnc "Cristian"  # Hola Cristian

# Default Arguments
defmodule DefArguments do
  def hello(name, country \\ "en") do
    phrase(country) <> name
  end
  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

IO.puts DefArguments.hello("Sean", "en")  # "Hello, Sean"
IO.puts DefArguments.hello("Sean")        # "Hello, Sean"
IO.puts DefArguments.hello("Sean", "es")  # "Hola, Sean"
