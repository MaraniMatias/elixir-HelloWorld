IO.puts "Hello world from Elixir...\n"

# https://oylenshpeegul.wordpress.com/2015/10/25/hello-elixir/
greet = fn s -> IO.puts "Hello, #{s}!" end

if length(System.argv) == 0 do
    greet.("Try: \n elixir hello-word.exs Elixir")
else
    Enum.each(System.argv, greet)
end
