defmodule Kepler.Web.API.PositionController do
  use Kepler.Web, :controller

  def index(conn, %{"lat" => lat, "lon" => lon}) do
    with {lat, _} <- Float.parse(lat),
      {lon, _} <- Float.parse(lon),
      {:ok, positions} <- Kepler.Positions.list(lat, lon)
    do
      render(conn, positions: positions)
    end
  end
end