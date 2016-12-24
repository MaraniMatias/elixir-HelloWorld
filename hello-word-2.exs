# https://oylenshpeegul.wordpress.com/2015/10/25/hello-elixir/

greet = fn s -> IO.puts "1: Hello, #{s}!" end

hello = fn
  [] -> greet.("World")
  list -> Enum.each(list, greet)
end

hello.(System.argv)

# I try other

greet2 = fn s ->
  IO.puts "2: Hello, #{s}!"
end

hello2 = fn
  [] -> greet2.("World")
  list -> list |> Enum.each(greet2)
end

hello2.(System.argv)
