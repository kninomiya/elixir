defmodule MyApp.SampleCLI do
  use ExCLI.DSL

  name "mycli"
  description "My CLI"

  option :verbose, count: true, aliases: [:v]
  command :calculation do
    aliases [:cl]
    description "計算する"
    argument :item
    option :price, help: "Price of item. e.g. 1000, 10000, etc"
    option :taxRate, help: "tax rate e.g. 1.08"

    run context do
      
      if (Calculation.validate(context) === :ok) do
         IO.puts("#{context.item}!")
         Calculation.run(context[:price], context[:taxRate])
      else

         IO.puts("Invalid price or taxRate")
      end
    end
  end
end

ExCLI.run!(MyApp.SampleCLI)

