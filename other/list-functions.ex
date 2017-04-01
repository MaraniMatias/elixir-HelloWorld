# Creating New Lists with Higher-Order Functions
print = fn(value) -> IO.puts(" #{value}") end
#Function<6.106461118/1 in :erl_eval.expr/5>
list = [1, 2, 4, 8, 16, 32]
IO.inspect Enum.each(list, print)

square = &(&1 * &1)
IO.inspect Enum.map(list, square) # [1, 4, 16, 64, 256, 1024]

IO.inspect Enum.map(1..3, square)  # [1, 4, 9]
IO.inspect Enum.map(-2..2, square) # [4, 1, 0, 1, 4]
IO.inspect Enum.map(?a..?d, square)
IO.inspect for value <- list, do: value * value

# Filtering List Values
four_bits = fn(value) -> (value >= 0) and (value < 16) end
IO.inspect Enum.filter(list, four_bits)
for value <- list, value >= 0, value < 16, do: IO.inspect value

