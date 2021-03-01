defmodule MyApp.Account.Gift do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "gifts" do
    field :categories, {:array, :string}
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(gift, attrs) do
    gift
    |> cast(attrs, [:name, :categories])
    |> validate_required([:name, :categories])
    |> unique_constraint(:name)
  end
end
