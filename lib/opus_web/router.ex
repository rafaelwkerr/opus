defmodule OpusWeb.Router do
  use OpusWeb, :router

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

  scope "/", OpusWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", OpusWeb do
    pipe_through :api
    resources "/jobs", JobController, except: [:new, :edit]
    post "/jobs/schedule", JobController, :schedule
  end

  pipeline :exq do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
    plug ExqUi.RouterPlug, namespace: "exq"
  end

  scope "/exq", ExqUi do
    pipe_through :exq
    forward "/", RouterPlug.Router, :index
  end

end
