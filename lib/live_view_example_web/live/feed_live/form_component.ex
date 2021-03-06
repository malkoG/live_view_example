defmodule LiveViewExampleWeb.FeedLive.FormComponent do
  use LiveViewExampleWeb, :live_component

  alias LiveViewExample.Community

  @impl true
  def update(%{feed: feed} = assigns, socket) do
    changeset = Community.change_feed(feed)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"feed" => feed_params}, socket) do
    changeset =
      socket.assigns.feed
      |> Community.change_feed(feed_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"feed" => feed_params}, socket) do
    save_feed(socket, socket.assigns.action, feed_params)
  end

  defp save_feed(socket, :edit, feed_params) do
    case Community.update_feed(socket.assigns.feed, feed_params) do
      {:ok, _feed} ->
        {:noreply,
         socket
         |> put_flash(:info, "Feed updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_feed(socket, :new, feed_params) do
    case Community.create_feed(feed_params) do
      {:ok, _feed} ->
        {:noreply,
         socket
         |> put_flash(:info, "Feed created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
