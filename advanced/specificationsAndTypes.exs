# Specification
@spec sum_product(integer) :: integer
def sum_product(a) do
  [1, 2, 3]
  |> Enum.map(fn el -> el * a end)
  |> Enum.sum
end

# Custom types
@spec sum_times(integer, %Examples{first: integer, last: integer}) :: integer
def sum_times(a, params) do
  for i <- params.first..params.last do
    i
  end
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum
    |> round
end
#  @type – simple, public type. Internal structure of type is public.
#  @typep – type is private and could be used only in the module where is defined.
#  @opaque – type is public, but internal structure is private.

defmodule Examples do
  defstruct first: nil, last: nil
  @type t(first, last) :: %Examples{first: first, last: last}
  @type t :: %Examples{first: integer, last: integer}
end

@spec sum_times(integer, Examples.t) :: integer
def sum_times(a, params) do
  for i <- params.first..params.last do
    i
  end
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum
    |> round
end

@spec sum_times(integer, Examples.t(integer, integer)) :: integer
def sum_times(a, params) do
  for i <- params.first..params.last do
    i
  end
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum
    |> round
end

# Documentation of types
defmodule Examples do
  @typedoc """
    Type that represents Examples struct with :first as integer and :last as integer.
  """
  @type t :: %Examples{first: integer, last: integer}
end
