# Processes Talking Amongst Themselves
defmodule MphDrop do
  def mph_drop do
    drop_pid = spawn(Drop, :drop, [])
    convert(drop_pid)
  end

  def convert(drop_pid) do
    receive do
      {planemo, distance} ->
        send(drop_pid, {self(), planemo, distance})
        convert(drop_pid)
      {planemo, distance, velocity} ->
        mph_velocity = 2.23693629 * velocity
        IO.write("On #{planemo}, a fall of #{distance} meters ")
        IO.puts("yields a velocity of #{mph_velocity} mph.")
        convert(drop_pid)
    end
  end
end

#iex(1)> pid1 = spawn(MphDrop, :mph_drop, [])
# #PID<0.47.0>
#iex(2)> send(pid1, {:earth, 20})
# On earth, a fall of 20 meters
# yields a velocity of 44.289078952755766 mph.
# {:earth,20}
#iex(3)> send(pid1, {:mars, 20})
# On mars, a fall of 20 meters
# yields a velocity of 27.250254686571544 mph.
# {:mars,20}


