# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :photo_dump,
  ecto_repos: [PhotoDump.Repo]

# Configures the endpoint
config :photo_dump, PhotoDump.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zaeNSLO0/KmrQhtB5gDkQWTEOMFEHSarPRnzKcWtBJPFiP/80qhBx6BjHGLIWLhk",
  render_errors: [view: PhotoDump.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhotoDump.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
