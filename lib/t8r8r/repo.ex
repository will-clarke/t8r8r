defmodule T8r8r.Repo do
  use Ecto.Repo,
    otp_app: :t8r8r,
    adapter: Ecto.Adapters.Postgres
end
