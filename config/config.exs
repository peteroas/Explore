# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :explore,
  ecto_repos: [Explore.Repo]

# Configures the endpoint
config :explore, ExploreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "USbXYa1auH/30ympDHvrhntkQ4bwV+KbOYl/KklCcNpfy7LliF0gVr9u+mK+mLWM",
  render_errors: [view: ExploreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Explore.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
