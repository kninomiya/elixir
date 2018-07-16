defmodule Lesson.ExchangeGain do

  @doc """
  calculate 為替差益を計算します
  ## パラメータ

    - positionType: 所有している建玉種別を指定 ( `:pos_bid`(売建玉) もしくは `pos_ask`(買建玉) )
    - expectedRate: 決済時の期待為替レート 例) 売(或いは買)建玉を所有しており、109円で買(或いは売)決済したい場合 `109.0` と指定
    - positionRate: 買(或いは売)建時の為替レートを指定
    - positionAmount: 所有している建玉の数を指定
    - tradingUnit: 取引単位(通貨ペアごとに決められた取引単位)を指定
  """
  def calculate(positionType, expectedRate, positionRate, positionAmount, tradingUnit) do

    case(positionType) do
       :pos_bid -> (positionRate - expectedRate) * (positionAmount * tradingUnit)
       :pos_ask -> (expectedRate - positionRate) * (positionAmount * tradingUnit)
       _ -> raise "Invalid exchange type"
    end
  end
end
