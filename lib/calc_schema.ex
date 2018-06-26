defmodule CalcSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "item" do
    field :item, :string
    field :price, :integer
    field :taxRate, :float
  end

  def validate(calc, context) do
    calc |> cast(context, [:item, :price, :taxRate])
	 |> validate_required([:item, :price, :taxRate])
	 |> validate_number(:price, greater_than_or_equal_to: 1)
	 |> validate_number(:taxRate, greater_than_or_equal_to: 1.00)
  end
end


