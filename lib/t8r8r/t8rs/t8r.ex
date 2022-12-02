defmodule T8r8r.T8rs.T8r do
  use Ecto.Schema
  import Ecto.Changeset

  schema "t8r" do
    field :elo_score, :integer
    field :image_location, :string
    field :votes_lost, :integer
    field :votes_total, :integer
    field :votes_won, :integer

    timestamps()
  end

  @doc false
  def changeset(t8r, attrs) do
    t8r
    |> cast(attrs, [:image_location, :votes_total, :elo_score, :votes_won, :votes_lost])
    |> validate_required([:image_location, :votes_total, :elo_score, :votes_won, :votes_lost])
  end
end
