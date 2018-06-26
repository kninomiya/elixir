defmodule Calculation do

  def run(price, taxRate) do
    getTaxPrice(price, taxRate) |> createResultMessage |> IO.puts
  end
  def validate(context) do

    result = CalcSchema.validate(%CalcSchema{}, context)

    if (result.valid?) do
       :ok
    else
       :ng
    end
  end

  def getTaxPrice(price, taxRate) do
    { intPrice, "" } = Integer.parse(price)
    { floatTaxRate, "" } = Float.parse(taxRate)
    
    intPrice * floatTaxRate
  end
  def createResultMessage(cost) do
    "Total: #{cost}"
  end
end
