defmodule Calculation do
  import Number.Delimit;

  def run(context) do
#    getTaxPrice(context[:price], context[:taxRate]) |> (&createResultMessage(context[:item], &1)).() |> IO.puts
    getTaxPrice(context[:price], context[:taxRate]) |> createResultMessage(context) |> IO.puts
  end
  def validate(context) do

    result = CalcSchema.validate(%CalcSchema{}, context)

    if (result.valid?) do
       :ok
    else
       result.data |> IO.puts
       :ng
    end
  end

  def getTaxPrice(price, taxRate) do
    { intPrice, "" } = Integer.parse(price)
    { floatTaxRate, "" } = Float.parse(taxRate)

    Float.ceil(intPrice * floatTaxRate)
  end

  def createResultMessage(cost, context) do
    
    "Total: \\#{number_to_delimited(cost, precision: 0)} \n" <>
    "\t * #{context.item}: \\#{number_to_delimited(context.price, precision: 0)} * #{number_to_delimited(context.taxRate, precision: 2)}"
  end
end
