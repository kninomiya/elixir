# As an example, let’s write a simple test case using Elixir’s test framework called ExUnit:

defmodule CalculationTest do
  use ExUnit.Case, async: true

  test "calc taxPrice for 100 yen(tax: 8%) juice" do
    assert Calculation.run(%{item: "Juice", price: "100", taxRate: "1.08"}) === :ok
  end

  test "invalid item price " do
    assert Calculation.validate(%{item: "Juice", price: nil, taxRate: "1.08"}) === :ng
  end
  test "validate taxPrice for 100 yen(tax: 8%) juice" do
    assert Calculation.validate(%{item: "Juice", price: "100", taxRate: "1.08"}) === :ok
  end

  test "getTaxPrice" do
    assert Calculation.getTaxPrice("1000", "1.05") === 1050
  end
end

