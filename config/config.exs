# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elm_elixir_phx,
  ecto_repos: [ElmElixirPhx.Repo]

# Configures the endpoint
config :elm_elixir_phx, ElmElixirPhx.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LdqO96q+fasbHkJ1bxa5YznYOAfyPN3Fl03/LX9n58ZaVNWGd+KCiYCeojuR8F/F",
  render_errors: [view: ElmElixirPhx.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElmElixirPhx.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
