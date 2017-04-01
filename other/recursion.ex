# Simple Recursion

defmodule Count do

  def countdown(from) when from >= 0 do
    IO.inspect(from)
    countdown(from-1)
  end
  def countdown(from) do # warning: variable from is unused
    IO.puts("blastoff!")
  end

  def countup(limit) do
    countup(1,limit)
  end
  defp countup(count, limit) when count <= limit do
    IO.inspect(count)
    countup(count+1, limit)
  end
  # use underscore to avoid "unused variable" warnings
  defp countup(_count, _limit) do
    IO.puts("finished!")
  end
end

defmodule Fact do
  def factorial(n) when n > 1 do
    IO.puts("Calling from #{n}.")
    result = n * factorial(n - 1)
    IO.puts("#{n} yields #{result}.")
    result
  end

  def factorial(n) when n <= 1 do
    IO.puts("Calling from 1.")
    IO.puts("1 yields 1.")
    1
  end
end

defmodule Fact2 do

  def factorial(n) do
    factorial(1, n, 1)
  end

defp factorial(current, n, result) when current <= n do
    new_result = result * current
    IO.puts("#{current} yields #{new_result}.")
    factorial(current + 1, n, new_result)
  end

defp factorial(_current, _n, result) do
    IO.puts("finished!")
    result
  end

end
