# Testing Lists
list = [1, 2, 4, 8, 16, 32]
is_int = fn(value) -> is_integer(value) end
IO.inspect Enum.all?(list, is_int) # true
IO.inspect Enum.any?(list, is_int) # true
compare = &(&1 > 10)
IO.inspect Enum.all?(list, compare) # false
IO.inspect Enum.any?(list, compare) # true

# Splitting Lists
IO.inspect Enum.partition(list, compare) # {[16, 32], [1, 2, 4, 8]}
list1 = &(&1 < 4)
IO.inspect Enum.drop_while([1, 2, 4, 8, 4, 2, 1], list1) # [4, 8, 4, 2, 1]
IO.inspect Enum.take_while([1, 2, 4, 8, 4, 2, 1], list1) # [1, 2]

# Folding Lists
sumsq = fn(value, accumulator) -> accumulator + value * value end
IO.inspect List.foldl([2, 4, 6], 0, sumsq) # this retrun fn is a new acc.. # 56

divide = fn(value, accumulator) -> value / accumulator end
IO.inspect 1/2/4/8/16/32 # 3.0517578125e-5
IO.inspect List.foldl(list, 1, divide) # foldL 8.0
IO.inspect 32/16/8/4/2/1 # 0.03125
IO.inspect List.foldr(list, 1, divide) # foldR 0.125
