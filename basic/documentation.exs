# Documenting Modules
defmodule Greeter do
  @moduledoc """
    Provides a function `hello/1` to greet a human
  """
  def hello(name) do
    "Hello, " <> name
  end
end

# iex> c("greeter.ex") #=> [Greeter]
# iex> h Greeter

# Documenting Functions
defmodule Greeter do
  @moduledoc """
  ...
  """
  @doc """
    Prints a hello message

    ## Parameters
       - name: String that represents the name of the person.
    ## Examples
       iex> Greeter.hello("Sean") #=> "Hello, Sean"
       iex> Greeter.hello("pete") #=> "Hello, pete"
  """
  @spec hello(String.t) :: String.t
  def hello(name) do
    "Hello, " <> name
  end
end
