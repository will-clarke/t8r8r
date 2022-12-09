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
    images = ~w(
priv/static/images/t8rs/12964232c2cca107ee8af7771d5c412f.jpg
priv/static/images/t8rs/19ccd7b96244fa968cb82df09407afe5.jpg
priv/static/images/t8rs/1c3a177ffded2a0d9901bfffdc6cd4ef.jpg
priv/static/images/t8rs/1e713f0544ff126082558260d844b3d1.jpg
priv/static/images/t8rs/260edc2c69dd0a58c5316a088f48ef45.jpg
priv/static/images/t8rs/3050b33796a89f92e37385e6790caf30.jpg
priv/static/images/t8rs/340d53aed955ae04fac2baf3e4549183.jpg
priv/static/images/t8rs/3857ffb5c155d11b8714787e62c3dd5b.jpg
priv/static/images/t8rs/61e5951140cae6358cb1fb96c5d36323.jpg
priv/static/images/t8rs/6d027333dbd89602fd3d1b98f3805509.jpg
priv/static/images/t8rs/6e9811cdb30c11e981e3ea34b2871e6b.jpg
priv/static/images/t8rs/74259d90d969beaab1c687c715b47a75.jpg
priv/static/images/t8rs/76abea59a4ed64b5ad15c881a4f74010.jpg
priv/static/images/t8rs/79b87195905eeb4d9c10a0e91f2da568.jpg
priv/static/images/t8rs/87b37fe5c1f7c648922c932d8dcb8eee.jpg
priv/static/images/t8rs/8aa06c6ff9f262e8faa97854e9dd45da.jpg
priv/static/images/t8rs/8c4e0f7e12b0ff2817a4125b7433e7e9.jpg
priv/static/images/t8rs/8de788bc37b85773ba6d1fcf5f132bc7.jpg
priv/static/images/t8rs/94bdee09e7af6559c6af08c50ab95c70.jpg
priv/static/images/t8rs/9ad6fd31f5e98c54210342eb5ed00047.jpg
priv/static/images/t8rs/9c51f4e3ea6fe36de3baf1db95bf81e5.jpg
priv/static/images/t8rs/9e5520073bc7864ef3c05e7e3de0a2ae.jpg
priv/static/images/t8rs/9eeb653446d87f399b036912b4ebfc41.jpg
priv/static/images/t8rs/a46cbf95969179cff161069d6286b661.jpg
priv/static/images/t8rs/b23a039ba3f1034696a5c21acf9eb3ed.jpg
priv/static/images/t8rs/c686168146d901f19a0572c0f4d8b646.jpg
priv/static/images/t8rs/d0b509d015358ab617566920bd3e884d.jpg
priv/static/images/t8rs/eaeac637539e57ecd4c7ea231d6c7376.jpg
priv/static/images/t8rs/ebe45d59db06b85969d4e0b9054b2d4a.jpg
priv/static/images/t8rs/f76647228f8a1a819e21d933d1bfe8f3.jpg
priv/static/images/t8rs/fa13c748f0a43b2b1211e40c0d62a321.jpg
priv/static/images/t8rs/ffee8032059f9f1298042e14166af8b6.jpg
    )

    for imgName <- images do
      stripped = String.replace(imgName, "priv/static", "")

      T8r8r.Repo.insert!(%T8r8r.T8rs.T8r{
        image_location: stripped,
        elo_score: 1000,
        votes_lost: 0,
        votes_total: 0,
        votes_won: 0
      })
    end
  end
end
