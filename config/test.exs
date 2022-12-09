import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :t8r8r, T8r8r.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "t8r8r_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :t8r8r, T8r8rWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "uDWd4hhwj3LOC8JKdTDxlkumMHLl9c+yWieCJDntwFeZv0SzSK8g/STuIzGs/3Ry",
  server: false

# In test we don't send emails.
config :t8r8r, T8r8r.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
