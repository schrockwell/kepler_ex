defmodule Kepler.Positions do
  import Kepler.Util
  
  def list(lat, lon) do
    observer = build_observer(lat, lon)
    
    results = for sat_record <- Kepler.AmateurSatellite.list_records do
      {sat_record.satnum, Satellite.current_position(sat_record, observer)}
    end

    {:ok, Enum.into(results, %{})}
  end
end