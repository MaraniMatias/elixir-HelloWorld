#
# Creating Services with gen_server
#
# It provides a core set of methods that let you set up a process, respond to requests, end the process gracefully, and even pass state to a new process if this one needs to be upgraded in place.

defmodule DropServer do
  use GenServer

  defmodule State do
    defstruct count: 0
  end

  # This is a convenience method for startup
  def start_link do
    GenServer.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  # These are the callbacks that GenServer.Behaviour will use
  def init([]) do
    {:ok, %State{}}
  end

  def handle_call(request, _from, state) do
    distance = request
    reply = {:ok, fall_velocity(distance)}
    new_state = %State{count: state.count + 1}
    {:reply, reply, new_state}
  end

  def handle_cast(_msg, state) do
    IO.puts("So far, calculated #{state.count} velocities.")
    {:noreply, state}
  end

  def handle_info(_info, state) do
    {:noreply, state}
  end

  def terminate(_reason, _state) do
    {:ok}
  end

  def code_change(_old_version, state, _extra) do
    {:ok, state}
  end

  # internal function
  def fall_velocity(distance) do
    :math.sqrt(2 * 9.8 * distance)
  end

end

#iex(1)> DropServer.start_link()
#iex(1-a)> {:ok, pid} = DropServer.start_link()
# {:ok,#PID<0.46.0>}
#iex(2)> GenServer.call(DropServer, 20)
# {:ok,19.79898987322333}
#iex(3)> GenServer.call(DropServer, 40)
# {:ok,28.0}
#iex(4)> GenServer.call(DropServer, 60)
# {:ok,34.292856398964496}
#iex(5)> GenServer.cast(DropServer, {})
# So far, calculated 3 velocities.
# :ok

#
# A Simple Supervisor
#
defmodule DropSup do
  use Supervisor

  # convenience method for startup
  def start_link do
    Supervisor.start_link(__MODULE__, [], [{:name, __MODULE__}])
  end

  # supervisor callback
  def init([]) do
    child = [worker(DropServer, [], [])]
    supervise(child, [{:strategy, :one_for_one}, {:max_restarts, 1},
      {:max_seconds, 5}])
  end

  # Internal functions (none here)
end

#iex(1)> {:ok, pid} = DropSup.start_link()
# {:ok,#PID<0.44.0>}
#iex(2)> Process.unlink(pid)
# true
#iex(3)> Process.whereis(DropServer)
# #PID<0.45.0>
#iex(4)> GenServer.call(DropServer, 60)
# {:ok,34.292856398964496}
#iex(5)> GenServer.call(DropServer, -60)
# Error
#iex(5)> GenServer.call(DropServer, 60)
# {:ok,34.292856398964496}
#iex(6)> Process.whereis(DropServer)
# #PID<0.46.0>

