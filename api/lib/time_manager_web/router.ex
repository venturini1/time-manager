defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TimeManagerWeb do
    pipe_through :api

    # USERS ROUTES
    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete

    # CLOCKS ROUTES
    post "/clocks/:userID", ClockController, :create
    get "/clocks/:userID", ClockController, :show

    # WORKING TIMES ROUTES
    get "/workingtimes/", WorkingTimeController, :index
    get "/workingtimes/:userID", WorkingTimeController, :show
    get "/workingtimes/:userID/:id", WorkingTimeController, :show_by_id
    post "/workingtimes/:userID", WorkingTimeController, :create
    put "/workingtimes/:id", WorkingTimeController, :update
    delete "/workingtimes/:id", WorkingTimeController, :delete
  end

  pipeline :auth do
    plug :accepts, ["json"]
  end

  scope "/auth", TimeManagerWeb do
    pipe_through :auth

    # AUTH ROUTES
    post "/get_token", AuthController, :get_token
    get "/me", AuthController, :me
  end

  pipeline :doc do
  end

  scope "/doc", TimeManagerWeb do
    pipe_through :doc

    # DOC ROUTE
    get "/", DocController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
          # Ajoutez un commentaire pour la documentation
    # Page d'accueil qui présente les endpoints
      live_dashboard "/dashboard", metrics: TimeManagerWeb.Telemetry
    end
  end
end
