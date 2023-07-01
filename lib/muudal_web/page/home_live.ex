defmodule MuudalWeb.Page.HomeLive do
  @moduledoc """

  """

  use MuudalWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="font-semibold text-3xl mb-4">Cows</h1>

    <MuudalWeb.CoreComponents.modal id="create_modal">
      <h2>Add a pet.</h2>
    </MuudalWeb.CoreComponents.modal>

    <MuudalWeb.CoreComponents.button phx-click={MuudalWeb.CoreComponents.show_modal("create_modal")}>
      Add New Cow +
    </MuudalWeb.CoreComponents.button>
    """
  end

  @impl true
  def handle_event(event, params, socket) do
    Logger.error("unrecognised event: #{event} with params: #{inspect(params)}")
    {:noreply, socket}
  end
end
