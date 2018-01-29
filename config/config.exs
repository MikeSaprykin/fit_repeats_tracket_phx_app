# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :fit_repeats_tracker,
  ecto_repos: [FitRepeatsTracker.Repo],
  error_handler: FitRepeatsTracker.Accounts.AuthErrorHandler



# Configures the endpoint
config :fit_repeats_tracker, FitRepeatsTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2G7NJwCHH1S0yLAOl3emWYrCce6VMusGOh8qHXX6aYAyn2fztJsdQiIHj/mnIoJM",
  render_errors: [view: FitRepeatsTrackerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: FitRepeatsTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
