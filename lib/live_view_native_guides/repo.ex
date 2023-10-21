defmodule LiveViewNativeGuides.Repo do
  use Ecto.Repo,
    otp_app: :live_view_native_guides,
    adapter: Ecto.Adapters.Postgres
end
