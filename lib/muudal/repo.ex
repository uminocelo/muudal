defmodule Muudal.Repo do
  use Ecto.Repo,
    otp_app: :muudal,
    adapter: Ecto.Adapters.Postgres
end
