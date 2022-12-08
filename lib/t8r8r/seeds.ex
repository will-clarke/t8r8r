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

# To run this, you need to
# $ fly ssh console
# $ ./app/bin/t8r8 remote
# {IEX} ? T8r8r.SeedDB.seedTheDatabase

defmodule T8r8r.SeedDB do
  def seedTheDatabase do
    images = [
      "priv/static/images/t8rs/1-cce955b4be92817efd1bf28fb11940d5.jpg",
      "priv/static/images/t8rs/2-a5edf407c0f594f07cc5bb68f29a558b.jpg",
      "priv/static/images/t8rs/3-f5aad0255872b4ccc8b9994ec757dc2a.jpg",
      "priv/static/images/t8rs/4-32f569be4ec901ed429f3671069599ab.jpg",
      "priv/static/images/t8rs/5-79b87195905eeb4d9c10a0e91f2da568.jpg",
      "priv/static/images/t8rs/6-74259d90d969beaab1c687c715b47a75.jpg",
      "priv/static/images/t8rs/7-896cab5acd2f8564d56ae8c23cc0aed0.jpg",
      "priv/static/images/t8rs/8-bc0921755f949d073065eda974e2389f.jpg"
    ]

    for imgName <- images do
      stripped = String.replace(imgName, "priv/static", "")

      T8r8r.Repo.insert!(%T8r8r.T8rs.T8r{
        image_location: stripped
      })
    end
  end
end
