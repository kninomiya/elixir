defmodule Lesson.ExchangeGainUse do
  @usd_yen_trading_unit 10000

  alias Lesson.ExchangeGain
  defp getPosBids(), do: [{110.843, 8}, {111.151, 8}, {111.526, 2}, {112.501, 4} ]

  def main() do
    posBids = getPosBids()

    IO.puts("米ドル円売建, 1ドル111円で一括買決済した場合収益(期待値)計算")
    estimateBulkAsk(posBids, 111.0)

    IO.puts("米ドル円売建, 1ドル110円で一括買決済した場合収益(期待値)計算")
    estimateBulkAsk(posBids, 110.0)

    IO.puts("米ドル円売建, 1ドル109円で一括買決済した場合収益(期待値)計算")
    estimateBulkAsk(posBids, 109.0)
  end

  defp estimateBulkAsk(posBids, expected_rate) do

    posBids
    |> Enum.map(fn pos -> ExchangeGain.calculate(:pos_bid, expected_rate, elem(pos, 0), elem(pos, 1), @usd_yen_trading_unit) end)
    |> Enum.reduce(fn (gain, sum) -> (sum + gain) end)
    |> IO.puts
  end
end
