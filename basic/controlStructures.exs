# if and unless
# It should be noted that in Elixir, the only falsey values are nil and the boolean false.

if true, do: IO.puts 1 + 2
if false, do: IO.puts :this, else: IO.puts :that

if String.valid?("Hello") do
  IO.puts  "Valid string!"
else
  IO.puts "Invalid string."
end

if "a string value" do
  IO.puts "Truthy"
end

unless is_integer("hello") do
  IO.puts "Not an Int"
end

# case
case {:ok, "Hello World"} do
 {:ok, result} -> result
 {:error} -> IO.puts "Uh oh!"
  _ -> IO.puts "Catch all"          # “everything else” (~default)
end

pie = 3.14
case "cherry pie" do
  ^pie -> IO.puts "Not so tasty"
  pie -> IO.puts "I bet #{pie} is tasty"
end
#=>  "I bet cherry pie is tasty"

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    IO.puts "Will match"
  _ ->
    IO.puts "Won't match"
end
#=> "Will match"

case 1 do
  x when hd(x) -> IO.puts "Won't match"
  x -> IO.puts "Got #{x}"
end
#=> "Got 1"

# cond  (~ else if)
cond do
  2 + 2 == 5 -> IO.puts "This will not be true"
  2 * 2 == 3 -> IO.puts "Nor this"
  1 + 1 == 2 -> IO.puts "But this will"
  true -> "Catch all"  # default
end
#=> "But this will"





