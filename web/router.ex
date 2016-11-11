defmodule Noot.Router do
  use Noot.Web, :router

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :require_login do
    plug Guardian.Plug.EnsureAuthenticated, handler: Noot.Handler.GuardianErrorHandler
    plug Noot.Plug.GuardianCanaryBridge
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Noot do
    pipe_through [:browser, :browser_session] # Use the default browser stack

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/users", UserController, only: [:new, :create, :show]
  end

  scope "/", Noot do
    pipe_through [:browser, :browser_session, :require_login]
    resources "/users", UserController, only: [:index, :delete, :edit, :update]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Noot do
  #   pipe_through :api
  # end
end
