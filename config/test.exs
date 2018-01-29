use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fit_repeats_tracker, FitRepeatsTrackerWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :fit_repeats_tracker, FitRepeatsTracker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  hostname: System.get_env("POSTGRES_HOSTNAME"),
  database: System.get_env("POSTGRES_DB"),
  pool: Ecto.Adapters.SQL.Sandbox
