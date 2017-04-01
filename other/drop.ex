defmodule Drop do
  @spec fall_velocity(atom(),number()) :: number()

  def fall_velocity(planemo, distance) when distance >= 0 do
    gravity = case planemo do
     :earth -> 9.8
     :moon  -> 1.6
     :mars  -> 3.71
    end

   velocity = :math.sqrt(2 * gravity * distance)

    if velocity > 20 do
      IO.puts("Look out below!")
    else
      IO.puts("Reasonable...")
    end

  velocity

  end
  def fall_velocity({planemo, distance}) do
    Drop.fall_velocity(planemo,distance) 
  end
end
