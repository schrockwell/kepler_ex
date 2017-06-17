defmodule Kepler.Web.Router do
  use Kepler.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Kepler.Web do
    pipe_through :browser

    get "/*path", PageController, :index
  end

  scope "/api", Kepler.Web.API do
    pipe_through :api

    get "/positions", PositionController, :index
    get "/passes", PassController, :index
  end
end
