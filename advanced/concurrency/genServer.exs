# GenServer
# As OTP Server is a module with the  GenServer behavior that implements a set of callbacks.

# Start
# SimpleQueue.start_link([1, 2, 3])
# SimpleQueue.dequeue # 1
# SimpleQueue.dequeue # 2
# SimpleQueue.queue   # [3]

# Syschronous Functions
defmodule SimpleQueue do
  use GenServer

  ### GenServer API
  @doc """
    GenServer.init/1 callback
  """
  def init(state), do: {:ok, state}

  # It's necessary to interact with GenServers inn a synchronus way.
  # Calling a function and wating for its response.
  @doc """
    genServer.handle_call/3 callback
  """
  def handle_call(:dequeue, _from, [value|state]) do
    {:reply, value, state}
  end
  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}
  def handle_call(:queue, _from, state), do: {:reply, state, state}

  ### Cliente API
  @doc """
    Start our queue and linnk it.
    This is a helper method.
  """
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
  def queue, do: GenServer.call(__MODULE__, :queue)
  def dequeue, do: GenServer.call(__MODULE__, :defmodule)
end
