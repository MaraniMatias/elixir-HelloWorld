[1, x, 4, y] = [1, 2, 4, 8]
IO.puts x
IO.puts y

insert = [2, 4, 8]
full = [1, insert, 16, 32]
IO.inspect full
neat = List.flatten(full)
IO.inspect neat

a = [1, 2, 4]
b = [8, 16, 32]
IO.inspect [a, b]               # [[1, 2, 4], [8, 16, 32]]
IO.inspect Enum.concat(a, b)    # [1, 2, 4, 8, 16, 32]
IO.inspect a ++ b               # [1, 2, 4, 8, 16, 32]
c = [64, 128, 256]
IO.inspect Enum.concat([c,b,a]) # [64, 128, 256, 8, 16, 32, 1, 2, 4]

# Elixir takes a different approach, letting you process the first item in a list, the head, while extracting the rest of the list, the tail, so that you can pass it to another call recursively. 
list = [1, 2, 4]
[h1 | t1] = list
IO.inspect h1 # 1
IO.inspect t1 # [2, 4]
[h2 | t2] = t1
IO.inspect h2 # 2
IO.inspect t2 # [4]
[h3 | t3] = t2
IO.inspect h3 # 4
IO.inspect t3 # []
# [h4 | t4] = t3 # ** (MatchError) no match of right hand side value: []
IO.inspect Enum.reverse c # [256, 128, 64]

IO.inspect [1 | [2, 3]] # [1, 2, 3]
IO.inspect [1, 2 | [3]] # [1, 2, 3]
IO.inspect [1, 2 | 3]   # [1, 2 | 3] # It not list normal

defmodule Overall do
  # Overall.product('funny')
  # Overall.product([1,2,3,4])
  # Overall.product([],2)
  def product([]) do
    0
  end

  def product(list) do
    product(list, 1)
  end

  def product([], accumulated_product) do
    accumulated_product
  end

  def product([head | tail], accumulated_product) do
    product(tail, head * accumulated_product)
  end
end

defmodule ListDrop do
  @moduledoc """
  ListDrop.falls([{:earth, 20}, {:moon, 20}, {:mars, 20}]))
  """
  def falls(list) do
    falls(list, [])
  end

  defp falls([], results) do
    # results
    Enum.reverse(results)
  end

  defp falls([head|tail], results) do
    falls(tail, [Drop.fall_velocity(head) | results])
  end
end
