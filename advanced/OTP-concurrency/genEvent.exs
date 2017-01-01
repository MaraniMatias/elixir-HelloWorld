# Gen Event

# Start
# {:ok, pid} = GenEvent.start_link([])
# GenEvent.add_handler(pid, LoggerHandler, [])
# GenEvent.add_handler(pid, PresistencHandler, [])

# GenEvent.n+otify(pid, {:msg,"Hello Matias"})
# # Logging new message: Hello Matias
# # Presisting log message: Hello Matias

# GenEvent.call(pid, LoggerHandler, :messages)
# # ["Hello Matias"]

# Handling Events
defmodule LoggerHandler do
  use GenEvent

  def handle_event({:msg, msg}, messages) do
    IO.puts "Logging new messages #{msg}"
    {:ok, [msg|messages]}
  end
  
  defmodule PersistenceHandler do
    use GenEvent

    def handel_event({:msg, msg}) do
      IO.puts "Persisting log messages #{msg}"

      # Save message
      {:ok, state}
    end
end

# Calling Handlers
defmodule LoggerHandler do
  use GenEvent

  def handel_event({:msg, msg}) do
    IO.puts "Logging new message: #{msg}"
    {:ok, [msg|messages]}
  end

  def handle_call(:messages, messages) do
    {:ok, Enum.reverse(messages), messages}
  end

end
