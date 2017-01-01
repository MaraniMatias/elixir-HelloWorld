# Processes
defmodule Example do
  def add(a, b) do
    IO.puts(a + b)
  end
end
Example.add(2, 3) # 5 :ok
# function asynchronously
spawn(Example, :add, [2, 3]) #  5 #PID<0.80.0>

# Message Passing
defmodule Example do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "World"
    end
    listen
  end
end

pid = spawn(Example, :listen, []) # #PID<0.108.0>
send pid, {:ok, "hello"}  #  World # {:ok, "hello"}
end pid, :ok              #  :ok

# Process Linking
defmodule Example do
  def explode, do: exit(:kaboom)
end

spawn(Example, :explode, [])      # #PID<0.66.0>
spawn_link(Example, :explode, []) # ** (EXIT from #PID<0.57.0>) :kaboom

defmodule Example do
  def explode, do: exit(:kaboom)
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end
  end
end

Example.run # Exit reason: kaboom # :ok

# Process Monitoring
defmodule Example do
  def explode, do: exit(:kaboom)
  def run do
    {pid, ref} = spawn_monitor(Example, :explode, [])
    receive do
      {:DOWN, ref, :process, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end
  end
end
Example.run # Exit reason: kaboom # :ok

# Agents
{:ok, agent} = Agent.start_link(fn -> [1, 2, 3] end)    # {:ok, #PID<0.65.0>}
Agent.update(agent, fn (state) -> state ++ [4, 5] end)  # :ok
Agent.get(agent, &(&1))                                 # [1, 2, 3, 4, 5]

Agent.start_link(fn -> [1, 2, 3] end, name: Numbers)    # {:ok, #PID<0.74.0>}
Agent.get(Numbers, &(&1))                               # [1, 2, 3]

# Tasks
defmodule Example do
  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end

task = Task.async(Example, :double, [2000]) # %Task{pid: #PID<0.111.0>, ref: #Reference<0.0.8.200>}

# Do some work
Task.await(task) # 4000
