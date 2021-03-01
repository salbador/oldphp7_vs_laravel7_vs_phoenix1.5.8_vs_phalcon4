defmodule MyApp.Account.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "employees" do
    field :interests, {:array, :string}
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:name, :interests])
    |> validate_required([:name, :interests])
    |> unique_constraint(:name)
  end
end
