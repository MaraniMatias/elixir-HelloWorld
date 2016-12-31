# IO.puts raise ArgumentError, message: "the argument value is invalid"
try do
  raise "Oh no!"
rescue
  e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
end
#  An error occurred: Oh no!
#  :ok

try do
  raise "Oh no!"
rescue
  e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
end
#  An error occurred: Oh no!
#  :ok

# After (finally)
try do
  raise "Oh no!"
rescue
  e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
after
  IO.puts "The end!"
end
#  An error occurred: Oh no!
#  The end!
#  :ok

{:ok, file} = File.open "example.json"
try do
  # Do hazardous work
after
  File.close(file)
end

# New Errors
defmodule ExampleError do
  defexception message: "an example error has occurred"
end

try do
  raise ExampleError
rescue
  e in ExampleError -> e
end
#  %ExampleError{message: "an example error has occurred"}

# Throws
try do
  for x <- 0..10 do
    if x == 5, do: throw(x)
    IO.puts(x)
   end
catch
  x -> "Caught: #{x}"
end
#  0
#  1
#  2
#  3
#  4
#  "Caught: 5"

# Exiting
spawn_link fn -> exit("oh no") end # ** (EXIT from #PID<0.101.0>) "oh no"

try do
  exit "oh no!"
catch
  :exit, _ -> "exit blocked"
end
#  "exit blocked"

