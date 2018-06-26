# As an example, let’s write a simple test case using Elixir’s test framework called ExUnit:

defmodule CalculationTest do
  use ExUnit.Case, async: true

  test "calc taxPrice for 100 yen(tax: 8%) juice" do
    assert Calculation.run("100", "1.08") === :ok
  end
end

