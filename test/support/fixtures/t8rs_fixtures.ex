defmodule T8r8r.T8rsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `T8r8r.T8rs` context.
  """

  @doc """
  Generate a t8r.
  """
  def t8r_fixture(attrs \\ %{}) do
    {:ok, t8r} =
      attrs
      |> Enum.into(%{
        elo_score: 42,
        image_location: "some image_location",
        votes_lost: 42,
        votes_total: 42,
        votes_won: 42
      })
      |> T8r8r.T8rs.create_t8r()

    t8r
  end
end
