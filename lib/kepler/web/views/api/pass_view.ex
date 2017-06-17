defmodule Kepler.Web.API.PassView do
  use Kepler.Web, :view

  def render("index.json", %{passes: passes}) do
    pass_views = for pass <- passes do
      sat = Kepler.AmateurSatellite.get(pass.satnum)
      %{
        sat: sat,
        aos: event_view(pass.aos),
        max: event_view(pass.max),
        los: event_view(pass.los),
      }
    end

    %{
      passes: pass_views,
    }
  end

  defp event_view(event) do
    %{
      az:    event.azimuth_in_degrees,
      el:    event.elevation_in_degrees,
      range: event.range,
      at:    event.datetime |> Timex.to_unix,
    }
  end
end