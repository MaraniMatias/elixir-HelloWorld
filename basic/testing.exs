# ExUnit
# $ mkdir test/
# $ vim test/test_helper.exs
ExUnit.start()
# $ vim test/example_test.exs
defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "assert " do
    assert 1 + 1 == 2
  end

  test "assert " do
    assert 1 + 1 == 3
  end

  test "refute" do
    refute 1 + 1 == 3
  end
end

defmodule SendingProcess do
  def run(pid) do
    send pid, :ping
  end
end

defmodule TestReceive do
  use ExUnit.Case

  test "receives ping" do
    SendingProcess.run(self)
    assert_received :ping
  end
end

# Capture_io and Capture_log
defmodule OutputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "outputs Hello World" do
    assert capture_io(fn -> IO.puts "Hello World" end) == "Hello World\n"
  end
end

# Test Setup
defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  setup_all do
    {:ok, number: 2}
  end

  test "the truth", state do
    assert 1 + 1 == state[:number]
  end
end

# $ mix test
