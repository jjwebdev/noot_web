# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :noot,
  ecto_repos: [Noot.Repo]

# Configures the endpoint
config :noot, Noot.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Sx66Rx02vs3EifufWEqx/YP5PDmUpVoukicabfS3bA1F56pZAiZPNfeuwRwPu94S",
  render_errors: [view: Noot.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Noot.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine
