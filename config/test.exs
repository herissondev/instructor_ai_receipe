import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ai_recipe, AiRecipeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Smw2vpg/7a8y2QtbpbwKzSxDGNCHMHpa8pL4wo64TTHiMsFvXiqgtDe99pdrWYuS",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
