#
# Creating New Logic
#

defmodule Logic do

  defmacro unless(condition, options) do
    quote do
      if(!unquote(condition), unquote(options))
    end
  end

end

#iex(1)> require(Logic)
#iex(2)> Logic.unless (4 == 5) do
#...(2)>   IO.puts("arithmetic still works")
#...(2)> end
# arithmetic still works
# :ok
