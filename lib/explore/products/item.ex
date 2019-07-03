defmodule Explore.Products.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price, :float
    field :description, :string
    field :quantity_in_stock, :integer, default: 0
    field :quantity_in_car, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :price, :description, :quantity_in_stock, :quantity_in_car])
    |> validate_required([:name, :price])
  end
end
