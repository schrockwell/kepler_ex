defmodule Kepler.Util do
  def build_observer(lat_deg, lon_deg) do
    %Satellite.Observer{
      latitude:  lat_deg |> deg2rad,
      longitude: lon_deg |> deg2rad,
      height: 0
    }
  end

  defp deg2rad(deg), do: deg * :math.pi / 180.0
end