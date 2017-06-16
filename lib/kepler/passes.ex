defmodule Kepler.Passes do
  import Kepler.Util

  @default_duration [days: 1]

  def list(lat, lon) do
    observer = build_observer(lat, lon)
    now = Timex.now |> Timex.to_erl
    until = Timex.now |> Timex.shift(@default_duration) |> Timex.to_erl

    list_passes = fn(sat_record) ->
      Satellite.list_passes_until(sat_record, observer, now, until)
    end

    passes =
      Kepler.AmateurSatellite.list_records
      |> Task.async_stream(list_passes, timeout: 60_000)
      |> Enum.to_list
      |> Enum.filter_map(&match?({:ok, _}, &1), &elem(&1, 1))
      |> List.flatten
      |> Enum.sort(&(&1.start_time < &2.start_time))

    {:ok, passes}
  end
end