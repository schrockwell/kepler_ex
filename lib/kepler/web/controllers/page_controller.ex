defmodule Kepler.Web.PageController do
  use Kepler.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
