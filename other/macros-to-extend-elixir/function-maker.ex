#
# Creating Functions Programatically
#
# Warning
# You can’t define a function programmatically outside of a module or inside of a function.

defmodule FunctionMaker do
  defmacro create_multiplier(function_name, factor) do
    quote do
      def unquote(function_name)(value) do
        unquote(factor) * value
      end
    end
  end
end

defmodule Multiply do
  require FunctionMaker

  FunctionMaker.create_multiplier(:double, 2)
  FunctionMaker.create_multiplier(:triple, 3)

  def example do
    x = triple(12)
    IO.puts("Twelve times 3 is #{x}")
  end

end

#iex(1)> Multiply.double(21)
# 42
#iex(2)> Multiply.triple(54)
# 162
#iex(3)> Multiply.example()
# Twelve times 3 is 36
# :ok


defmodule FunctionMaker2 do
  defmacro create_functions(planemo_list) do
    Enum.map planemo_list, fn {name, gravity} ->
      quote do
        def unquote(:"#{name}_drop")(distance) do
          :math.sqrt(2 * unquote(gravity) * distance)
        end
      end
    end
  end
end

defmodule Drop do
  require FunctionMaker2

  FunctionMaker2.create_functions([{:mercury, 3.7}, {:venus, 8.9},
    {:earth, 9.8}, {:moon, 1.6}, {:mars, 3.7},
    {:jupiter, 23.1}, {:saturn, 9.0}, {:uranus, 8.7},
    {:neptune, 11.0}, {:pluto, 0.6}])

end

#iex(1)> Drop.earth_drop(20)
# 19.79898987322333
#iex(2)> Drop.moon_drop(20)
# 8.0
