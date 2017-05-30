defmodule A do
  def oper(a,b,:add) do
    a+b
  end
  def oper(a,b,:sub) do
    a-b
  end

  def sum do
    1..5
    |> Enum.sum
    |> IO.puts
  end
end
A.sum
3 |> A.oper(4,:add) |> IO.puts
3 |> A.oper(4,:sub) |> IO.puts

"Jose" <> surname = "Jose Valin"
IO.puts surname

data = ["Elixir","Valin"]
[lang,author] = data
IO.puts "#{lang} by #{author}"


