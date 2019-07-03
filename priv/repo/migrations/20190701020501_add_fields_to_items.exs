defmodule Explore.Repo.Migrations.AddFieldsToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :description, :string
      add :quantity_in_stock, :integer
      add :quantity_in_car, :integer
    end
  end
end
