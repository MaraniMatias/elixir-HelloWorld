# Setting Up Records
defrecord Planemo, name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0
defrecord Tower, location: "", height: 20, planemo: :earth, name: ""
# Because records are modules, all you need to do to make a record available to your program is to be sure that it has been compiled and in the same directory as your other modules.

defmodule Planemo do
  require Record
  Record.defrecord :planemo, [name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0]
end

defmodule Tower do
  require Record
  Record.defrecord :tower, Tower, # Tower it is the tag. If you don’t provide a tag, Elixir uses the record name.
    [location: "", height: 20, planemo: :earth, name: ""]
end

#iex(1)> require Tower
# Tower
#iex(2)> tower1 = Tower.tower()
# {Tower, "", 20, :earth, ""}
#iex(3)> tower2 = Tower.tower(location: "Grand Canyon")
# {Tower, "Grand Canyon", 20, :earth, ""}
#iex(4)> tower3 = Tower.tower(location: "NYC", height: 241, name: "Woolworth Building")
# {Tower, "NYC", 241, :earth, "Woolworth Building"}
#iex(5)> tower4 = Tower.tower location: "Rupes Altat 241", height: 500, planemo: :moon, name: "Piccolini View"
# {Tower, "Rupes Altat 241", 500, :moon, "Piccolini View"}
#iex(6)> tower5 = Tower.tower planemo: :mars, height: 500, name: "Daga Vallis", location: "Valles Marineris"
# {Tower, "Valles Marineris", 500, :mars, "Daga Vallis"}
#iex(7)> Tower.tower(tower5, :planemo)
# :mars
#iex(8)> import Tower
#  nil
#iex(9)> tower(tower5, :height)
# 500
#iex(10)> tower5
# {Tower, "Valles Marineris", 500, :mars, "Daga Vallis"}
#iex(11)> tower5 = tower(tower5, height: 512)
# {Tower, "Valles Marineris", 512, :mars, "Daga Vallis"}
