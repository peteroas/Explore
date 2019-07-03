defmodule Explore.Repo do
  use Ecto.Repo,
    otp_app: :explore,
    adapter: Ecto.Adapters.Postgres
end
