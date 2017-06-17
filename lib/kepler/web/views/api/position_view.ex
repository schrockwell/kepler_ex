defmodule Kepler.Web.API.PositionView do
  use Kepler.Web, :view

  def render("index.json", %{positions: positions}) do
    position_views = for {sat_id, position} <- positions do
      sat = Kepler.AmateurSatellite.get(sat_id)
      %{
        sat:    sat,
        el:     position.elevation_in_degrees,
        az:     position.azimuth_in_degrees,
        range:  position.range,
        lat:    position.latitude,
        lon:    position.longitude,
        height: position.height,
      }
    end

    %{
      positions: position_views
    }
  end
end