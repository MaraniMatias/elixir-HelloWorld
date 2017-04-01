defmodule Zip do
  def main() do
    list1 = [:earth, :moon, :mars]
    list2 = [9.8, 1.6, 3.71]
    planemos = Enum.zip(list1, list2)
    separate_lists = Enum.unzip(planemos)
    IO.inspect planemos       # [earth: 9.8, moon: 1.6, mars: 3.71]
    IO.inspect separate_lists # [[:earth, :moon, :mars], [9.8, 1.6, 3.71]]
    IO.puts ":)"
  end
end

defmodule Pascal do
  @moduledoc
  """
    Pascal.triangle(4)
  """
  def triangle(rows \\ 4) do
    triangle([[0,1,0]], 1, rows)
  end

  defp triangle(list, count, rows) when count >= rows do
    Enum.reverse(list) # End
  end

  defp triangle(list, count, rows) do
    [previous | _] = list
    triangle([add_row(previous) | list], count + 1, rows)
  end

  def add_row(initial) do
    add_row(initial, 0, [])
  end

  defp add_row([], 0, final) do
    [0 | final] # End
  end

  defp add_row([h | t], last, new) do
    add_row(t, h, [last + h | new])
  end
end
