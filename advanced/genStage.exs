# Introduction
# https://elixirschool.com/lessons/advanced/gen-stage/
# It is a “specification and computational flow for Elixir”.
# The GenStage specification recognizes three roles:
#  * :producer            — A source. Producers wait for demand from consumers and respond with the requested events.
#  * :producer_consumer   — Both a source and a sink. Producer-consumers can respond to demand from other consumers as well as request events from producers.
#  * :consumer            — A sink. A consumer requests and receives data from producers.

## Getting Started
# $ mix new genstage_example --sup
# $ cd genstage_example
# add up dependencies in mix.exs
  defp deps do [ {:gen_stage, "~> 0.7"} ] end
# $ mix do deps.get, compile

## Produceir
# The first step of our GenStage application is creating our producer.
# $ mkdir lib/genstage_example
# $ touch lib/genstage_example/producer.ex

defmodule GenstageExample.Producer do
  alias Experimental.GenStage
  use GenStage

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(counter), do: {:producer, counter}

  def handle_demand(demand, state) do
    events = Enum.to_list(state..state + demand - 1)
    {:noreply, events, (state + demand)}
  end
end

## Consumer
# lib/genstage_example/consumer.ex
defmodule GenstageExample.ProducerConsumer  do
  alias Experimental.GenStage
  use GenStage

  require Integer

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [GenstageExample.Producer]}
  end

  def handle_events(events, _from, state) do
    numbers =
      events
      |> Enum.filter(&Integer.is_even/1)

    {:noreply, numbers, state}
  end
end

## Putting It All Together
# lib/genstage_example.ex
def start(_type, _args) do
  import Supervisor.Spec, warn: false
  children = [
    worker(GenstageExample.Producer, [0]),
    worker(GenstageExample.ProducerConsumer, []),
    worker(GenstageExample.Consumer, []),
  ]
  opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
  Supervisor.start_link(children, opts)
end
# $ mix run --no-halt

## Multiple Producers or Consumers
# lib/genstage_example.ex
children = [
  worker(GenstageExample.Producer, [0]),
  worker(GenstageExample.ProducerConsumer, []),
  worker(GenstageExample.Consumer, [], id: 1),
  worker(GenstageExample.Consumer, [], id: 2),
]
# $ mix run --no-halt

## Use Cases
# GenStage and built our first example
# * Data Transformation Pipeline — Producers don’t have to be simple number generators. We could produce events from a database or even another source like Apache’s Kafka. With a combination of producer-consumers and consumers, we could process, sort, catalog, and store metrics as they become available.
# * Work Queue — Since events can be anything, we could produce works of unit to be completed by a series of consumers.
# * Event Processing — Similar to a data pipeline, we could receive, process, sort, and take action on events emitted in real time from our sources.

