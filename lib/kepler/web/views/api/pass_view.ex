defmodule Kepler.Web.API.PassView do
  use Kepler.Web, :view

  def render("index.json", %{passes: passes}) do
    pass_views = for pass <- passes do
      sat = Kepler.AmateurSatellite.get(pass.satnum)
      %{
        sat:               sat,
        start_time:        pass.start_time |> Timex.to_unix,
        start_azimuth:     pass.start_azimuth,
        end_time:          pass.end_time |> Timex.to_unix,
        end_azimuth:       pass.end_azimuth,
        start_magnitude:   pass.start_magnitude,
        end_magnitude:     pass.end_magnitude,
        # best_part_of_pass: pass.best_part_of_pass,
      }
    end

    %{
      passes: pass_views,
    }
  end
end