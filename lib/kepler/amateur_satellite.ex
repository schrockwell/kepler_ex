defmodule Kepler.AmateurSatellite do
  defstruct [:id, :name, :type, :notes]

  def list do
    [
      %__MODULE__{id: 27607, name: "SO-50", type: :fm,     notes: "145.850 up / 436.795 down PL 67.0"},
      %__MODULE__{id: 40967, name: "AO-85", type: :fm,     notes: "435.172 up / 145.980 down"},
      %__MODULE__{id: 7530,  name: "AO-7",  type: :linear, notes: ""},
      %__MODULE__{id: 39444, name: "AO-73", type: :linear, notes: "435.130-150 up, 145.950-970 down"},
      %__MODULE__{id: 24278, name: "FO-29", type: :linear, notes: "145.900-146.000 up / 435.800-900 down"},
      %__MODULE__{id: 40903, name: "XW-2A", type: :linear, notes: "435.030-050 up / 145.665-685 down"},
      %__MODULE__{id: 40911, name: "XW-2B", type: :linear, notes: "435.090-110 up / 145.730-750 down"},
      %__MODULE__{id: 40906, name: "XW-2C", type: :linear, notes: "435.150-170 up / 145.795-815 down"},
      %__MODULE__{id: 40907, name: "XW-2D", type: :linear, notes: "435.210-230 up / 145.860-880 down"},
      %__MODULE__{id: 40909, name: "XW-2E", type: :linear, notes: "435.270-290 up / 145.915-935 down"},
      %__MODULE__{id: 40910, name: "XW-2F", type: :linear, notes: "435.330-350 up / 145.980-146.000 down"},
      %__MODULE__{id: 25544, name: "ISS",   type: :fm,     notes: "437.8 up / 145.8 down"},
    ]
  end

  def list_records do
    list()
    |> Enum.map(&(&1.id))
    |> Enum.map(&Satellite.SatelliteDatabase.lookup/1)
    |> Enum.reject(&is_nil/1)
  end

  def get(id) do
    Enum.find(list(), &(&1.id == id))
  end
end