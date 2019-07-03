defmodule Explore.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :float

      timestamps()
    end

  end
end
