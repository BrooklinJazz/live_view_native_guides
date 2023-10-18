defmodule PicMapWeb.HelloLive do
  use Phoenix.LiveView
  use LiveViewNative.LiveView

  @impl true
  def render(%{platform_id: :swiftui} = assigns) do
    # This UI renders on the iPhone / iPad app
    ~SWIFTUI"""
    <VStack>
      <Text>
        Hello Native!
      </Text>
    </VStack>
    """
  end

  @impl true
  def render(%{} = assigns) do
    # This UI renders on the web
    ~H"""
    <div class="flex w-full h-screen items-center">
      <span class="w-full text-center">
        Hello web!
      </span>
    </div>
    """
  end
end
