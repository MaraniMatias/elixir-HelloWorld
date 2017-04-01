defmodule Ask do
  def chars() do
    IO.puts(
"""
Which planemo are you on?
 1. Earth
 2. Moon
 3. Mars
"""
)
    # It only takes the first character in the other buffered stores
    IO.getn("Which? > ")
  end


  def line() do
    planemo=get_planemo()
    distance=get_distance()
    Drop.fall_velocity({planemo, distance})
  end

  defp get_planemo() do
    IO.puts(
    """
Which planemo are you on?
 1. Earth
 2. Earth's Moon
 3. Mars
 """
    )

    answer = IO.gets("Which? > ") # returns the entire value the user entered as a string, including the newline, and leaves nothing in the buffer
    value = String.first(answer)
    char_to_planemo(value)
  end

  defp get_distance() do
    input = IO.gets("How far? (meters) > ")
    value = String.strip(input)
    String.to_integer(value)
  end

  defp char_to_planemo(char) do
    case char do
      "1" -> :earth
      "2" -> :moon
      "3" -> :mars
    end
  end
end
