#
# Functions versus Macros
#

defmodule Difference do

  defmacro m_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end

  def f_test(x) do
    IO.puts("#{inspect(x)}")
    x
  end

end
#iex(1)> require Difference
#iex(2)> Difference.f_test(1 + 3)
# 4
# 4
#iex(3)> Difference.m_test(1 + 3)
# {:+, [line: 3], [1, 3]}
# 4
