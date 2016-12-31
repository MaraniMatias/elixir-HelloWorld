# Getting Started
defmodule ExampleApp.CLI do
  def main(args \\ []) do
    # Do stuff
  end
end

defmodule ExampleApp.Mixfile do
  def project do
    [
      app: :example_app,
      version: "0.0.1",
      escript: escript
    ]
  end
  def escript do
    [main_module: ExampleApp.CLI]
  end
end


defmodule ExampleApp.CLI do
  def main(args \\ []) do
    args
    |> parse_args
    |> response
    |> IO.puts
  end

  defp parse_args(args) do
    {opts, word, _} =
        args
          |> OptionParser.parse(switches: [upcase: :boolean])

    {opts, List.to_string(word)}
  end

  defp response({opts, word}) do
    if opts[:upcase], do: String.upcase(word), else: word
  end
end

# Building
# $ mix escript.build
# $ ./example_app --upcase Hello
# $ ./example_app Hi
