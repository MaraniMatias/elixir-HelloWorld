# Setting Up Structs
defmodule Planemo do
  defstruct name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defmodule Tower do
  defstruct location: "", height: 20, planemo: :earth, name: ""
end

IO.inspect %Tower{} # %Tower{height: 20, location: "", name: "", planemo: :earth}
IO.inspect %Tower{location: "Grand Canyon"} # %Tower{height: 20, location: "Grand Canyon", name: "", planemo: :earth}
IO.inspect %Tower{location: "NYC", height: 241, name: "Woolworth Building"} # %Tower{height: 241, location: "NYC", name: "Woolworth Building", planemo: :earth}
tower = %Tower{planemo: :mars, height: 500, name: "Daga Vallis", location: "Valles Marineris"} # %Tower{height: 500, location: "Valles Marineris", name: "Daga Vallis", planemo: :mars}
IO.inspect tower.name # "Daga Vallis"

# Pattern Matching Against Structs
%Tower{planemo: p, location: where} = tower
IO.inspect p
IO.inspect where

# Using Structs in Functions
defmodule StructDrop do
  def fall_velocity(t) do
    fall_velocity(t.planemo, t.height)
  end
  def fall_velocity_1(%Tower{planemo: planemo, height: distance}) do
    fall_velocity(planemo, distance)
  end
  def fall_velocity_2(t = %Tower{planemo: planemo, height: distance}) do
    IO.puts("From #{t.name}'s elevation of #{distance} meters on #{planemo},")
    IO.puts("the object will reach #{fall_velocity(planemo, distance)} m/s")
    IO.puts("before crashing in #{t.location}")
  end

  defp fall_velocity(:earth, distance) when distance >= 0 do
    :math.sqrt(2 * 9.8 * distance)
  end
  defp fall_velocity(:moon, distance) when distance >= 0 do
    :math.sqrt(2 * 1.6 * distance)
  end
  defp fall_velocity(:mars, distance) when distance >= 0 do
    :math.sqrt(2 * 3.71 * distance)
  end
end

IO.inspect StructDrop.fall_velocity(tower)
IO.inspect StructDrop.fall_velocity_1(tower)
IO.inspect StructDrop.fall_velocity_2(tower)

