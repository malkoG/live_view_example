defmodule LiveViewExample.Repo do
  use Ecto.Repo,
    otp_app: :live_view_example,
    adapter: Ecto.Adapters.Postgres
end
