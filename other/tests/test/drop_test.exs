setup_all do
  IO.puts "Beginning all tests"

  on_exit fn ->
   IO.puts "Exit from all tests"
  end

  {:ok, [connection: :fake_PID}]}
end

setup context do
  IO.puts "About to start a test. Connection is #{Map.get(context, :connection)}"

  on_exit fn ->
    IO.puts "Individual test complete."
  end

  :ok
end

test "Zero distance gives zero velocity", context do
  IO.puts "In zero distance test. Connection is #{Map.get(context, :connection)}"
  assert Drop.fall_velocity(:earth,0) == 0
end

defmodule DropTest do
  use ExUnit.Case, async: true

  test "Zero distance gives zero velocity" do
    assert Drop.fall_velocity(:earth,0) == 0
  end

  test "Mars calculation correct" do
    assert Drop.fall_velocity(:mars, 10) == :math.sqrt(2 * 3.71 * 10)
  end
end

defmodule Drop2Test do
  use ExUnit.Case, async: true
  test "Earth calculation correct" do
    calculated = Drop.fall_velocity(:earth, 1)
    assert_in_delta calculated, 4.4, 0.05,
      "Result of #{calculated} is not within 0.05 of 4.4"
  end
end

defmodule Drop3Test do
  use ExUnit.Case, async: true
  test "Earth calculation correct" do
    calculated = Drop.fall_velocity(:earth, 1)
    # da un rango al test :D
    assert_in_delta calculated, 4.4, 0.0001,
      "Result of #{calculated} is not within 0.0001 of 4.4"
  end
end



defmodule Drop4Test do
  use ExUnit.Case, async: true
  test "Unknown planemo causes error" do
    assert_raise CaseClauseError, fn ->
      Drop.fall_velocity(:planetX, 10)
    end
  end

  test "Negative distance causes error" do
    assert_raise ArithmeticError, fn ->
      Drop.fall_velocity(:earth, -10)
    end
  end
end
