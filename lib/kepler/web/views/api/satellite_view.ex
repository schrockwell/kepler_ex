defmodule Kepler.Web.API.SatelliteView do
  use Kepler.Web, :view

  def render("show.json", %{sat: sat}) do
    sat
  end
end