#Exceptions, Errors
defmodule Drop do
  def fall_velocity(planemo, distance) do
    try do
      gravity = case planemo do
        :earth -> 9.8
        :moon -> 1.6
        :mars -> 3.71
      end
      :math.sqrt(2 * gravity * distance)
    rescue
      ArithmeticError -> {:error, "Distance must be non-negative"}
      CaseClauseError -> {:error, "Unknown planemo #{planemo}"}
      err in [ErlangError, RuntimeError] -> {:error, err}
    end
  end
end

#Logging Progress and Failure
require Logger
counter = 24
Logger.info("About to begin test") # 18:57:36.846 [info]  About to begin test
Logger.debug("Current value of counter is #{counter}") # 18:58:06.526 [debug] Current value of counter is 255
Logger.warn("Connection lost; will retry.") # 18:58:21.759 [warn]  Connection lost; will retry.
Logger.error("Unable to read database.") # 18:58:37.008 [error] Unable to read database.

# Tracing Messages
#iex(0)> alias :dbg, as: Dbg # :dbg
#iex(1)> :dbg.tracer() # {:ok,#PID<0.71.0>}
#iex(2)> pid1 = spawn(MphDrop, :mph_drop, []) # #PID<0.148.0>
#iex(3)> :dbg.p(pid1, :m) # {:ok, [{:matched, :nonode@nohost, 1}]}
#iex(4)> send(pid1, {:moon, 20})
#On moon, a fall of 20 meters {:moon, 20}
#(<0.148.0>) << {moon,20}
#yields a velocity of 17.89549032 mph.
#(<0.148.0>) <0.149.0> ! {<0.148.0>,moon,20}
#(<0.148.0>) << {moon,20,8.0}
#(<0.148.0>) <0.50.0> ! {io_request,<0.148.0>,#Ref<0.0.2.159>,
#                           {put_chars,unicode,
#                               <<"On moon, a fall of 20 meters ">>}}
#(<0.148.0>) << {io_reply,#Ref<0.0.2.159>,ok}
#(<0.148.0>) <0.50.0> ! {io_request,<0.148.0>,#Ref<0.0.3.350>,
#                           {put_chars,unicode,
#                               <<"yields a velocity of 17.89549032 mph.\n">>}}
#(<0.148.0>) << {io_reply,#Ref<0.0.3.350>,ok}

#iex(1)> :dbg.tracer() # {:ok,#PID<0.43.0>}
#iex(2)> :dbg.p(:all, :c) # {:ok, [{:matched, :nonode@nohost, 51}]}
#iex(3)> :dbg.tpl(Fact, :factorial, []) # {:ok, [{:matched, :nonode@nohost, 2}]}
#iex(4)> Fact.factorial(4)
#1 yields 1.
#(<0.26.0>) call 'Elixir-Fact':factorial(4)
#(<0.26.0>) call 'Elixir-Fact':factorial(1,4,1)
#2 yields 2.
#(<0.26.0>) call 'Elixir-Fact':factorial(2,4,1)
#3 yields 6.
#(<0.26.0>) call 'Elixir-Fact':factorial(3,4,2)
#4 yields 24.
#(<0.26.0>) call 'Elixir-Fact':factorial(4,4,6)
#finished!
#(<0.26.0>) call 'Elixir-Fact':factorial(5,4,24)
#24
