# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphical,
  ecto_repos: [Graphical.Repo]

# Configures the endpoint
config :graphical, GraphicalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "POSnefKdlu/Ncgk3sQUU436yJH37iYx0xrTNvjGDuiT8Mgjxnvp41nKiI4IQsq+r",
  render_errors: [view: GraphicalWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Graphical.PubSub,
           adapter: Phoenix.PubSub.PG2]


config :graphical, Graphical.Guardian,
issuer: "graphical",
secret_key: "dNgFGziXpkKLBKlBqkB8quK6VKRBXrTZQfMh8fManbj06fAQ+vr5D8nIP5OW+UHr"


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
