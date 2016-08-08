# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix12, Phoenix12.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6fWtz6sptpqN30r+2JKq3XQsSVyMhgm61keowJoc2pXI64JTcydkvkpiwwMrE5aM",
  render_errors: [view: Phoenix12.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phoenix12.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
