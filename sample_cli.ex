defmodule MyApp.SampleCLI do
  use ExCLI.DSL

  name "mycli"
  description "My CLI"

  def calc(price, taxRate) do
    {intPrice, ""} = Integer.parse(price)
    {floatTaxRate, ""} = Float.parse(taxRate)

    intPrice * floatTaxRate
  end
  def createResultMessage(cost) do
    "合計: #{cost}"
  end

  option :verbose, count: true, aliases: [:v]
  command :calculation do
    aliases [:cl]
    description "計算する"
    argument :item
    option :price, help: "Price of item. e.g. 1000, 10000, etc"
    option :taxRate, help: "tax rate e.g. 1.08"

    run context do
      IO.puts("#{context.item}!")
      if taxRate = context[:taxRate] do
        IO.puts("taxRate: #{taxRate} : ")
      end
      if price = context[:price] do
        IO.puts("price: #{price}")
      end
   
      calc(price, taxRate) |> createResultMessage |> IO.puts
    end
  end
end

ExCLI.run!(MyApp.SampleCLI)

