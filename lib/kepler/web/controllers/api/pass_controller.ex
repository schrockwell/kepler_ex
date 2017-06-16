defmodule Kepler.Web.API.PassController do
  use Kepler.Web, :controller

  def index(conn, %{"lat" => lat, "lon" => lon}) do
    with {lat, _} <- Float.parse(lat),
      {lon, _} <- Float.parse(lon),
      {:ok, passes} <- Kepler.Passes.list(lat, lon)
    do
      render(conn, passes: passes)
    end
  end
end