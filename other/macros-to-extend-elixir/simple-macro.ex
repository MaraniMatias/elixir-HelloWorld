#
# A Simple Macro
#
defmodule Double do

  defmacro double x do
    {:*, [], [2, x]}
  end

end
#iex(1)> require Double
#iex(2)> Double.double(3)
# 6
#iex(3)> Double.double(3 * 7)
# 42

#iex(4)> quote do: 1 + 3
# {:+, [context: Elixir, import: Kernel], [1, 3]}
#iex(5)> x = 20
# 20
#iex(6)> quote do: 3 * x + 20
# {:+, [context: Elixir, import: Kernel], [{:*, [context: Elixir, import: Kernel], [3, {:x, [], Elixir}]}, 20]}

defmodule Double2 do

  defmacro double(x) do
    quote do
      2 * unquote(x)
    end
  end

end

#iex(8)> require Double
#iex(9)> Double.double(3 * 5)
# 30

## Warning
# The most common mistake people make when writing macros is to forget to unquote arguments. Remember that all of a macro’s arguments are already in internal format.
