defmodule Explore.Repo.Migrations.AddItems do
  use Ecto.Migration

  def up do
    create table(:items) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :encrypted_password, :string
      add :owner, references(:users)
      add :quantity_in_stock, :integer
      add :quantity_in_car, :integer

      timestamps()
    end

    create unique_index(:items, [:name])
    end
end
