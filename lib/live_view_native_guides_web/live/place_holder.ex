defmodule LiveViewNativeGuidesWeb.PlaceholderLive do
  use Phoenix.LiveView
  use LiveViewNative.LiveView

  @impl true
  def render(%{platform_id: :swiftui} = assigns) do
    # This UI renders on the iPhone / iPad app
    ~SWIFTUI"""
    <VStack>
      <Text>
        Waiting for updates from Livebook...
      </Text>
    </VStack>
    """
  end

  @impl true
  def render(%{} = assigns) do
    # This UI renders on the web
    ~H"""
    <div class="flex w-full h-screen items-center bg-orange-500 test">
      <span class="w-full text-center">
        Waiting for updates from Livebook...
      </span>
    </div>
    """
  end
end
