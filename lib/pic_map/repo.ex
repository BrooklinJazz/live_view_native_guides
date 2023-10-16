defmodule PicMap.Repo do
  use Ecto.Repo,
    otp_app: :pic_map,
    adapter: Ecto.Adapters.Postgres
end
