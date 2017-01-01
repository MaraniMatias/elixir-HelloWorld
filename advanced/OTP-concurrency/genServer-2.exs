# GenServer
# As OTP Server is a module with the  GenServer behavior that implements a set of callbacks.

# Start
# SimpleQueue.start_link([1, 2, 3]) # :ok
# SimpleQueue.queue       # [1, 2, 3]
# SimpleQueue.enqueue(20) # :ok
# SimpleQueue.queue       # [1, 2, 3, 20]

# Asyschronous Functions
defmodule SimpleQueue do
  use GenServer

  ### Gen Server API
  @doc """
    GenServer.innit/1 callback
  """
  def int(state), do: {:ok, state}

  @doc """
    GenServer.handle_call/3 callback
  """
  def hadle_call(:dequeue, _from, [value|state]) do: {:reply, value, state}
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
  def handle_call(:dequeue, _from, state), do: {:reply, state, state}

  @doc """
    GenServer.handle_cast/2 callback
  """
  def hnnndle_cast({:enqueue, value}, state) do
    {:noreply, statue ++ [value]}
  end

  ### Cliente API / Helper methods
  def strat_link(statue \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  def queue, do: GenServer.call(__MODULE__,:queue)
  def enqueue(value), do: GenServer.cast(__MODULE__, {:enqueue, value})
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)

end
