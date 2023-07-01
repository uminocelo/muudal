defmodule Muudal.Repo.Migrations.CreateCowsAndTraits do
  use Ecto.Migration

  def change do
    create(table(:cows)) do
      add(:name, :text, null: false)
      timestamps()
    end

    create(table(:traits)) do
      add(:coat, :text, null: false)
      add(:cow_id, references(:cows), null: false)
      timestamps()
    end
  end
end
