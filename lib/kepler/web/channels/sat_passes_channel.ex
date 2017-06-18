defmodule Kepler.Web.SatPassesChannel do
  use Kepler.Web, :channel
  import Phoenix.View, only: [render: 3]

  def join("amsat:passes", %{"location" => %{"coord" => [lat, lon]}}, socket) do
    socket = 
      socket
      |> assign(:lat, lat)
      |> assign(:lon, lon)

    send(self, :after_join)
    {:ok, socket}
  end
  def join(_, _, _), do: {:error, %{reason: "invalid params"}}

  def handle_in("refresh", _, socket) do
    push_passes_async(socket)
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    push_passes_async(socket)
    {:noreply, socket}
  end
  def handle_info(_, socket), do: {:noreply, socket}

  defp push_passes_async(socket) do  
    push(socket, "calculating", %{})

    Task.async(fn ->
      with {:ok, view} <- render_passes(socket) do
        push(socket, "passes", view)
      end
    end)
  end

  defp render_passes(socket) do
    with {:ok, passes} <- Kepler.Passes.list(socket.assigns.lat, socket.assigns.lon) do
      {:ok, render(Kepler.Web.API.PassView, "index.json", passes: passes)}
    else
      _ -> :error
    end
  end
end
