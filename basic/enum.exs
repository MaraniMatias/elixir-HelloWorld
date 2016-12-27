## elixir-lang.org/docs/stable/elixir/Enum.html
Enum.__info__(:functions) |> 
  Enum.each( fn( {function, arity} ) -> IO.puts "#{function}/#{arity}" end)

# all?
Enum.all?(["foo", "bar", "hello"], fn(s) ->
  IO.puts "all? ==3 :  #{String.length(s) == 3}"
end) # false
Enum.all?(["foo", "bar", "hello"], fn(s) ->
  IO.puts "all? >1 :  #{String.length(s) > 1}"
end) # true

Enum.all?([1, 2, 3]) # true
Enum.all?([1, nil, 3]) # false

# any?
Enum.any?(["foo", "bar", "hello"], fn(s) -> 
 IO.puts "any? ==5 :  #{String.length(s) == 5}"
end) # true

# chunk
Enum.chunk([1, 2, 3, 4, 5, 6], 2) # [ [1, 2], [3, 4], [5, 6] ]

# chunk_by
Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end) # [["one", "two"], ["three"], ["four", "five"]]
Enum.chunk_by(["one", "two", "three", "four", "five", "six"], fn(x) -> String.length(x) end) # [["one", "two"], ["three"], ["four", "five"], ["six"]]

# each
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

# map
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)        # [-1, 0, 1, 2]
Enum.map([a: 1, b: 2], fn({k, v}) -> {k, -v} end) # [a: -1, b: -2]
## join
Enum.map_join([1, 2, 3], &(&1 * 2)) # "246"
Enum.map_join([1, 2, 3], " = ", &(&1 * 2)) # "2 = 4 = 6"
## reduce
Enum.map_reduce([1, 2, 3], 0, fn(x, acc) -> {x * 2, x + acc} end)  {[2, 4, 6], 6}

# min
IO.puts Enum.min([5, 3, 0, -1]) # -1
IO.puts Enum.min_by(["a", "aa", "aaa"], fn(x) -> String.length(x) end)  #  "a"
IO.puts Enum.min_by(["a", "aa", "aaa", "b", "bbb"], &String.length/1)   #  "a"
# max
IO.puts Enum.max([5, 3, 0, -1]) # 5
IO.puts Enum.max_by(["a", "aa", "aaa"], fn(x) -> String.length(x) end) # "aaa"
IO.puts Enum.max_by(["a", "aa", "aaa", "b", "bbb"], &String.length/1) # "aaa"
# min_max
IO.puts Enum.min_max([2, 3, 1]) # {1, 3}

# reduce
IO.puts Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end) # 16
IO.puts  Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end) # 6
IO.puts  Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end) # "cba1"

# sort
Enum.sort([5, 6, 1, 3, -1, 4])        # [-1, 1, 3, 4, 5, 6]
Enum.sort([:foo, "bar", Enum, -1, 4]) # [-1, 4, Enum, :foo, "bar"]
## with our function
Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) ->
  x[:val] > y[:val]
end) # [%{val: 4}, %{val: 1}]
## without
Enum.sort([%{:count => 4}, %{:count => 1}]) # [%{count: 1}, %{count: 4}]

# uniq
Enum.uniq([1, 2, 2, 3, 3, 3, 4, 4, 4, 4]) # [1, 2, 3, 4]

# member
Enum.member?(1..10, 5)               # true
Enum.member?(1..10, 5.0)             # false
Enum.member?([1.0, 2.0, 3.0], 2)     # false
Enum.member?([1.0, 2.0, 3.0], 2.000) # true
Enum.member?([:a, :b, :c], :d)            # false

## elixir-lang.org/docs/stable/elixir/Enum.html
