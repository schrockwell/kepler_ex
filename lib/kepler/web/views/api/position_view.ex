defmodule Kepler.Web.API.PositionView do
  use Kepler.Web, :view

  def render("index.json", %{positions: positions}) do
    position_views = for {sat_id, position} <- positions do
      sat = Kepler.AmateurSatellite.get(sat_id)
      %{
        sat:           sat,
        elevation_deg: position.elevation_in_degrees,
        azimuth_deg:   position.azimuth_in_degrees,
        range_km:      position.range,
        magnitude:     position.satellite_magnitude,
      }
    end

    %{
      positions: position_views
    }
  end
end