defmodule MyApp.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :interests, {:array, :string}

      timestamps()
    end

    create unique_index(:employees, [:name])
  end
end
