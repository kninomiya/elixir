defmodule Lesson.ExchangeGainUse do
  @expected_rate 111
  @usd_yen_trading_unit 10000

  alias Lesson.ExchangeGain

  def main() do
    
    IO.puts("米ドル円売, 決済レート110での収益期待値")
    Enum.reduce([
      ExchangeGain.calculate(:pos_bid, @expected_rate, 110.843, 8, @usd_yen_trading_unit),
      ExchangeGain.calculate(:pos_bid, @expected_rate, 111.151, 8, @usd_yen_trading_unit),
      ExchangeGain.calculate(:pos_bid, @expected_rate, 111.526, 2, @usd_yen_trading_unit),
      ExchangeGain.calculate(:pos_bid, @expected_rate, 112.478, 2, @usd_yen_trading_unit),
      ExchangeGain.calculate(:pos_bid, @expected_rate, 112.482, 2, @usd_yen_trading_unit)
    ], fn (gain, sum) -> (sum + gain) end) |> IO.puts
  end
end
