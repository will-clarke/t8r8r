# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     T8r8r.Repo.insert!(%T8r8r.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule GlobalSetup do
  def run do
    for imgName <- Path.wildcard("priv/static/images/t8rs/*") do
      stripped = imgName = String.replace(imgName, "priv/static", "")

      T8r8r.Repo.insert!(%T8r8r.T8rs.T8r{
        elo_score: Enum.random(0..10),
        image_location: stripped,
        votes_lost: Enum.random(0..10),
        votes_total: Enum.random(0..10),
        votes_won: Enum.random(0..10)
      })
    end

    # T8r8r.Repo.insert!(%T8r8r.T8rs.T8r{})
    # T8r8r.Repo.insert!(%T8r8r.T8rs.T8r{image_location: "deliberately_wrong"})
  end
end
