defmodule Lesson.ExchangeGainUtil do
  alias Lesson.ExchangeGain

  def main(posType, posRate, posCount, expectedRate) do

    case posType do
      :pos_bid -> IO.puts("米ドル円売建, 1ドル#{expectedRate}円で一括買決済した場合収益(期待値)計算")
      :pos_ask -> IO.puts("米ドル円買建, 1ドル#{expectedRate}円で一括売決済した場合収益(期待値)計算")
      _ -> raise "無効な建種別"
    end

    ExchangeGain.calculate(posType, expectedRate, posRate, posCount, 10000) |> IO.puts
  end
end
