defmodule Drop do
  require Planemo
  def drop do
    setup
    handle_drops
  end

  def handle_drops do
    receive do
      {from, planemo, distance} ->
        send(from, {planemo, distance, fall_velocity(planemo, distance)})
        handle_drops
    end
  end

  def fall_velocity(planemo, distance) when distance >= 0 do
    p = hd(:ets.lookup(:planemos, planemo))
    :math.sqrt(2 * Planemo.planemo(p, :gravity) * distance)
  end

  def setup do
    :ets.new(:planemos, [:named_table,
      {:keypos, Planemo.planemo(:name) + 1}])
    info = [
      {:mercury, 3.7, 4878, 57.9},
      {:venus, 8.9, 12104, 108.2},
      {:earth, 9.8, 12756, 149.6},
      {:moon, 1.6, 3475, 149.6},
      {:mars, 3.7, 6787, 227.9},
      {:ceres, 0.27, 950, 413.7},
      {:jupiter, 23.1, 142796, 778.3},
      {:saturn, 9.0, 120660, 1427.0},
      {:uranus, 8.7, 51118, 2871.0},
      {:neptune, 11.0, 30200, 4497.1},
      {:pluto, 0.6, 2300, 5913.0},
      {:haumea, 0.44, 1150, 6484.0},
      {:makemake, 0.5, 1500, 6850.0},
      {:eris, 0.8, 2400, 10210.0}]
    insert_into_table(info)
  end

  def insert_into_table([]) do  # stop recursion
    :undefined
  end

  def insert_into_table([{name, gravity, diameter, distance} | tail]) do
    :ets.insert(:planemos, Planemo.new(name: name, gravity: gravity,
      diameter: diameter, distance_from_sun: distance))
    insert_into_table(tail)
  end
end

#iex(1)> c("drop.ex")
# [Drop]
#iex(2)> c("mph_drop.ex")
# [MphDrop]
#iex(3)> pid1 = spawn(MphDrop, :mph_drop, [])
# #PID<0.47.0>
#iex(4)> send(pid1, {:earth, 20})
# On earth, a fall of 20 meters yields a velocity of 44.289078952755766 mph.
# {:earth,20}
#iex(5)> send(pid1, {:eris, 20})
# On eris, a fall of 20 meters yields a velocity of 12.65402255793022 mph.
# {:eris,20}
#iex(6)> send(pid1, {:makemake, 20})
# On makemake, a fall of 20 meters yields a velocity of 10.003883211552367 mph.
# {:makemake,20}
