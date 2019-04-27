# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :opus, OpusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xJUbkzSr4N1tY7zAOlYzAzlXIz9fOz8zpdlVCIeS+5gSkPWadiY5qYYtgYtGor5G",
  render_errors: [view: OpusWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Opus.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Configures Exq
config :exq,
  name: Exq,
  host: "redis",
  port: 6379,
  namespace: "exq",
  concurrency: :infinite,
  queues: ["jobs"],
  poll_timeout: 50,
  scheduler_poll_timeout: 200,
  scheduler_enable: true,
  max_retries: 25,
  shutdown_timeout: 5000

# Configure Exq UI
config :exq_ui,
  server: true

# Configure Guardian
config :opus_app, Opus.Guardian,
  issuer: "opus_app",
  secret_key: "aQTMbwqsE1zWHZ4+TbtWWznKz6oaNGwQlb9ia1PtzRTOfIkXrDOV8M5N3JdmPWqn"

# Configure NanoId
config :nanoid,
  size: 21,
  alphabet: "_-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
