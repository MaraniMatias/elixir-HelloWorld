# Creating Maps
planemo_map = %{:earth => 9.8, :moon => 1.6, :mars => 3.71}
IO.inspect planemo_map
 number_map = %{2 => "two", 3 => "three"}
IO.inspect number_map
planemo_map_alt = %{earth: 9.8, moon: 1.6, mars: 3.71}
IO.inspect planemo_map_alt

# Updating Maps
altered_planemo_map = %{planemo_map | earth: 12, mars:3}
altered_planemo_map = %{planemo_map | :earth => 12, :mars => 3}
extended_planemo_map = Dict.put_new(planemo_map, :jupiter, 23.1)
IO.inspect altered_planemo_map

# Reading Maps
IO.inspect %{earth: earth_gravity} = planemo_map # %{earth: 9.8, mars: 3.71, moon: 1.6}
IO.inspect earth_gravity # 9.8
