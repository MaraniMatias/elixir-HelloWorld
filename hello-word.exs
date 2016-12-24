IO.puts "Hello world from Elixir...\n"

greet = fn s -> IO.puts "Hello, #{s}!" end

if length(System.argv) == 0 do
    greet.("Try: \n elixir hello-word.exs Elixir")
else
    Enum.each(System.argv, greet)
end
