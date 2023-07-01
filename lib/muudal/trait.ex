defmodule Muudal.Trait do
  use Ecto.Schema

  schema "traits" do
    field(:coat, :string)
    belongs_to(:cow, Muudal.Cow)
    timestamps()
  end

  def create_changeset(attrs) do
    %__MODULE__{}
    |> Ecto.Changeset.cast(attrs, [:coat, :cow_id])
    |> Ecto.Changeset.validate_required([:coat, :cow_id])
  end
end
