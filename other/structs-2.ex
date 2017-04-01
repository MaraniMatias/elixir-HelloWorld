defprotocol Valid do
  @doc "Returns true if data is considered nominally valid"
  def valid?(data)
end

defmodule Planemo do
  defstruct name: :nil, gravity: 0, diameter: 0, distance_from_sun: 0
end
defimpl Valid, for: Planemo do
  def valid?(p) do
    p.gravity >= 0 && p.diameter >= 0 &&
    p.distance_from_sun >= 0
  end
end

p = %Planemo{} # %Planemo{diameter: 0, distance_from_sun: 0, gravity: 0, name: nil}
IO.inspect Valid.valid?(p) # true
p2 = %Planemo{name: :weirdworld, gravity: -2.3} # %Planemo{diameter: 0, distance_from_sun: 0, gravity: -2.3, name: :weirdworld}
IO.inspect Valid.valid?(p2) # false
IO.inspect p2

defmodule Tower do
  defstruct location: "", height: 20, planemo: :earth, name: ""
end
defimpl Valid, for: Tower do
  def valid?(%Tower{height: h, planemo: p}) do
    h >= 0 && p != nil
  end
end
defimpl Inspect, for: Tower do
  import Inspect.Algebra
  def inspect(item, _options) do
    metres = concat(to_string(item.height), "m:")
    msg = concat([metres, break, item.name, ",", break, item.location, ",", break,to_string(item.planemo)])
  end
end

t = %Tower{}
IO.inspect Valid.valid?(t) # true
t2 = %Tower{height: -2, location: "underground"} # %Tower{height: -2, location: "underground", name: "", planemo: :earth}
IO.inspect Valid.valid?(t2)  # "241m: Woolworth Building, NYC, earth"
IO.inspect t2
