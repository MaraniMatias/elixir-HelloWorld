# Playing with Processes
## The Process's ID
IO.inspect self() #PID<0.71.0>
# Send msg, Elixir, however, will never report that a message send failed, even if the pid doesn’t point to a real process. It also won’t report that a message was ignored by a process.
# send(self(), :test1) # :test1
pid = self() #PID<0.26.0>
# send(pid, :test2) # :test2
# flush()

# send(self(), :test1) # :test1
# receive do x -> x  end # :test1
# send(self(), 23) # 23
# receive do y -> 2 * y end # 46

# Spawning Processes from Modules
defmodule Bounce do
  def report(count) do
    new_count = receive do
      msg -> IO.puts("Received #{count}: #{msg}")
      count + 1
    end
    report(new_count)
  end
end

#iex(1)> pid2 = spawn(Bounce, :report, [1])
# #PID<0.43.0>
# iex(2)> send(pid2, :test)
# :test
# Received 1: test
#iex(3)> send(pid2, :test2)
# :test2
# Received 2: test2
#iex(4)> send(pid2, :another)
# :another
# Received 3: another


