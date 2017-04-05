defmodule DropApp do
  @moduledoc """
  Documentation for DropApp.
  $ elixir -pa _build/dev/lib/drop_app/ebin --app drop_app
    Starting the app...
  """
  use Application

  def start(_type, _args) do
    IO.puts("Starting the app...") # show that app is really starting.
    DropSup.start_link()
  end

  @doc """
  Hello world.

  ## Examples

      iex> DropApp.hello
      :world

  """
  def hello do
    :world
  end
end
