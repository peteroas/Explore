defmodule ExploreWeb.Router do
  use ExploreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ExploreWeb.Plugs.SetCurrentUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExploreWeb do
    pipe_through :browser

    get "/", UserController, :index
    resources "/users", UserController

    resources "/sessions", SessionController, only: [:new, :create]
    get "/sign_out", SessionController, :delete

    resources "/registrations", RegistrationController, only: [:new, :create]

    resources "/items", ItemController

    get "/*path", ErrorController, :index

  end

  # Other scopes may use custom stacks.
  # scope "/api", ExploreWeb do
  #   pipe_through :api
  # end
end
