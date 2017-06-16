defmodule Kepler.Web.SatPositionsChannel do
  use Kepler.Web, :channel
  import Phoenix.View, only: [render: 3]

  def join("amsat:positions", %{"location" => %{"coord" => [lat, lon]}}, socket) do
    :timer.send_interval(1_000, self(), :tick)

    socket = 
      socket
      |> assign(:lat, lat)
      |> assign(:lon, lon)

    with {:ok, initial} <- render_positions(socket) do
      {:ok, initial, socket}
    else
      _ -> {:error, %{reason: "error"}}
    end
  end
  def join(_, _, _), do: {:error, %{reason: "invalid params"}}

  def handle_info(:tick, socket) do
    with {:ok, view} <- render_positions(socket),
      do: broadcast(socket, "positions", view)
    {:noreply, socket}
  end

  defp render_positions(socket) do
    with {:ok, positions} <- Kepler.Positions.list(socket.assigns.lat, socket.assigns.lon) do
      {:ok, render(Kepler.Web.API.PositionView, "index.json", positions: positions)}
    else
      _ -> :error
    end
  end
end
