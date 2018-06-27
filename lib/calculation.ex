
defmodule Calculation do
  import Number.Delimit;

  def run(context) do
    getTaxPrice(context[:price], context[:taxRate]) |> createResultMessage(context) |> IO.puts
  end
  def validate(context) do

    result = CalcSchema.validate(%CalcSchema{}, context)

    if (result.valid?) do
       :ok
    else
       result |> getErrorMessage |> IO.puts
       :ng
    end
  end
  def parse(key, value) do
    "#{key}: #{value}"
  end
  def getErrorMessage(validationResult) do
    errors = Ecto.Changeset.traverse_errors(
        validationResult, 
        fn {msg, opts} 
	-> Enum.reduce(opts, msg, 
			fn {key, value}, 
				acc -> String.replace(acc, "%{#{key}}", to_string(value)) 
			end) 
	end)
    Enum.map(errors, fn({key, value}) -> parse(key,value) end) |> Enum.join("\n")
  end
  def getFieldErrorMessage(field, constraints) do
    IO.inspect constraints
    field
  end
  def getTaxPrice(price, taxRate) do
    { intPrice, "" } = Integer.parse(price)
    { floatTaxRate, "" } = Float.parse(taxRate)

    intPrice * floatTaxRate |> Float.ceil |> Kernel.trunc
  end

  def createResultMessage(cost, context) do
    
    "Total: \\#{number_to_delimited(cost, precision: 0)} \n" <>
    "\t * #{context.item}: \\#{number_to_delimited(context.price, precision: 0)} * #{number_to_delimited(context.taxRate, precision: 2)}"
  end
end
