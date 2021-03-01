defmodule MyApp.Repo.Migrations.CreateGifts do
  use Ecto.Migration

  def change do
    create table(:gifts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :categories, {:array, :string}

      timestamps()
    end

    create unique_index(:gifts, [:name])
  end
end
