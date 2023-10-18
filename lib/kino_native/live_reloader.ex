defmodule KinoNative.LiveReloader do
  def reload do
    Phoenix.PubSub.broadcast(PicMap.PubSub, "reloader", :trigger)
  end
end
