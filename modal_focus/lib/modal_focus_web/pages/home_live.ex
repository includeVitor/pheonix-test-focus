defmodule ModalFocusWeb.HomeLive do
  @moduledoc """

  """
  alias ElixirSense.Plugins.Phoenix
  use ModalFocusWeb, :live_view
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <h1 class="font-semibold text-3xl mb-4">Modals</h1>

    <ModalFocusWeb.CoreComponents.modal id="modal_focus_first">
      <div id="modal_input-content">
        <input placeholder=".focus_first" />
      </div>
    </ModalFocusWeb.CoreComponents.modal>

    <ModalFocusWeb.CoreComponents.button phx-click={
      ModalFocusWeb.CoreComponents.show_modal("modal_focus_first")
    } class="top-2 mr-2"
    >
      Modal with JS.focus_first
    </ModalFocusWeb.CoreComponents.button>

    <ModalFocusWeb.CoreComponents.modal id="modal_focus">
      <input placeholder=".focus" id="modal_input" />
    </ModalFocusWeb.CoreComponents.modal>

    <ModalFocusWeb.CoreComponents.button phx-click={
      ModalFocusWeb.CoreComponents.show_modal("modal_focus")
      |> JS.focus(to: "#modal_input")
    }
    class="my-2"
    >
      Modal with JS.focus
    </ModalFocusWeb.CoreComponents.button>
    """
  end
end
