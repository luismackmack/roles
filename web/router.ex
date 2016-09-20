defmodule Roles.Router do
  use Roles.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Roles.Auth, repo: Roles.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Roles do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/manager", Roles.Manager, as: :manager do
    pipe_through :browser

    #get "/dashboard", DashboardController, :index
    resources "/dashboard", DashboardController
  end

  scope "/member", Roles.Member, as: :member do
    pipe_through :browser

    #get "/dashboard", DashboardController, :index
    resources  "/dashboard", DashboardController
  end

  scope "/observer", Roles.Observer, as: :observer do
    pipe_through :browser

    #get "/dashboard", DashboardController, :index
    resources "/dashboard", DashboardController
  end



  # Other scopes may use custom stacks.
  # scope "/api", Roles do
  #   pipe_through :api
  # end
end
