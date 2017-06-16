defmodule Kepler.Positions do
  def list(lat, lon) do
    observer = %Satellite.Observer{
      latitude: lat,
      longitude: lon,
      height: 0
    }
    
    results = for sat_record <- Kepler.AmateurSatellite.list_records do
      {sat_record.satnum, Satellite.current_position(sat_record, observer)}
    end

    {:ok, Enum.into(results, %{})}
  end
end