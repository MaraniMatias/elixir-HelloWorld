# Higher-Order Functions
defmodule Hof do
  def tripler(value, function) do
    3 * function.(value)
  end
end

my_function = fn(value) -> 20 * value end
IO.inspect  Hof.tripler(6, my_function) # 300
IO.inspect Hof.tripler(6, fn(value) -> 20 * value end)
ampersand_function = &(20 * &1)
IO.inspect Hof.tripler(6, ampersand_function) #360
IO.inspect Hof.tripler(6, &(20 * &1)) # 360

x = 20
IO.inspect x
my_function2 = fn(value) -> x * value end
my_function3 = &(x * &1)
x = 0
IO.inspect x
IO.inspect my_function2.(6)
IO.inspect Hof.tripler(6, my_function3)
Hof.tripler(:math.pi, &:math.cos(&1))
