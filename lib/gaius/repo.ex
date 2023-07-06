defmodule Gaius.Repo do
  use Ecto.Repo,
    otp_app: :gaius,
    adapter: Ecto.Adapters.Postgres
end
