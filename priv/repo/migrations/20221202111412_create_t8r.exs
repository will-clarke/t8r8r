defmodule T8r8r.Repo.Migrations.CreateT8r do
  use Ecto.Migration

  def change do
    create table(:t8r) do
      add :image_location, :string
      add :votes_total, :integer
      add :elo_score, :integer
      add :votes_won, :integer
      add :votes_lost, :integer

      timestamps()
    end
  end
end
