list = [1, 2, 3, 4, 5]
for x <- list, do: IO.puts x*x # [1, 4, 9, 16, 25]

# Keyword Lists
for {_key, val} <- [one: 1, two: 2, three: 3], do: IO.puts val #  [1, 2, 3]

# Maps
for {k, v} <- %{"a" => "A", "b" => "B"}, do: IO.puts {k, v} # [{"a", "A"}, {"b", "B"}]

# Binaries
for <<c <- "hello">>, do: IO.puts <<c>> #  ["h", "e", "l", "l", "o"]

for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: IO.puts val # ["Hello", "World"]

list1 = [1, 2, 3, 4]
for n <- list1, times <- 1..n do
  IO.puts  String.duplicate("*", times)
end
# ["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"]

for n <- list, times <- 1..n, do: IO.puts "n: #{n} - items: #{times}"

# Filters
import Integer
for x <- 1..10, is_even(x), do: IO.puts x  # [2, 4, 6, 8, 10]

for x <- 1..100, is_even(x), rem(x, 3) == 0, do: IO.puts x # [6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 96]

# :into
# Using :into, let’s create a map from a keyword list:
for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: IO.puts {k, v} # %{one: 1, three: 3, two: 2}

for c <- [72, 101, 108, 108, 111], into: "", do: IO.puts <<c>> # "Hello"
