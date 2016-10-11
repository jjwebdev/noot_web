use Mix.Config
config :noot, Noot.Endpoint,
  http: [port: 4001],
  server: false
config :logger, level: :warn
config :comeonin, bcrypt_log_rounds: 4
config :noot, Noot.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "travis_ci_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
