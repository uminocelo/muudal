defmodule Muudal.Cow do
  use Ecto.Schema

  schema "cows" do
    field(:name, :string)
    has_many(:trails, Muudal.Trait)
    timestamps()
  end

  def create_changeset(attrs) do
    %__MODULE__{}
    |> Ecto.Changeset.cast(attrs, [:name])
    |> Ecto.Changeset.validate_required([:name])
  end
end
