# Sometimes you want modules to share a public API,
# the solution for this in Elixir is behaviours. 
# 
# Behaviours perform two primary roles:
#  * Defining a set of function that must be implemented
#  * Checking whether that set was actually implemented

# Defining a behaviour
defmodule Example.Worker do
  @callback init(state :: term) :: {:ok, new_state :: term} | {:error, reason :: term}
  @callback perform(args :: term, state :: term) :: {:ok, result :: term, new_state :: term} | {:error, reason :: term, new_state :: term}
end

# Using behaviours
# Adding a behaviour to our module is easy with the @behaviour attribute.
# Using our new behaviour let’s create a module’s task.
defmodule Example.Downloader do
  @behaviour Example.Worker

  def init(opts), do: {:ok, opts}

  def perform(url, opts) do
    url
    |> HTTPoison.get!
    |> Map.fetch(:body)
    |> write_file(opts[:path])
    |> respond(opts)
  end

  defp write_file(:error, _), do: {:error, :missing_body}
  defp write_file({:ok, contents}, path) do
    path
    |> Path.expand
    |> File.write(contents)
  end

  defp respond(:ok, opts), do: {:ok, opts[:path], opts}
  defp respond({:error, reason}, opts), do: {:error, reason, opts}
end

# That compresses an array of files
defmodule Example.Compressor do
  @behaviour Example.Worker

  def init(opts), do: {:ok, opts}

  def perform(payload, opts) do
    payload
    |> compress
    |> respond(opts)
  end

  defp compress({name, files}), do: :zip.create(name, files)

  defp respond({:ok, path}, opts), do: {:ok, path, opts}
  defp respond({:error, reason}, opts), do: {:error, reason, opts}
end
