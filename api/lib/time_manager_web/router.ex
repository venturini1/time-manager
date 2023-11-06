defmodule TimeManagerWeb.Router do
  use TimeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TimeManagerWeb do
    pipe_through :api
    # USERS ROUTES
    resources "/users", UserController, except: [:new, :edit]

    # CLOCKS ROUTES
    post "/clocks/:userID", ClockController, :create
    get "/clocks/:userID", ClockController, :show

    # WORKING TIMES ROUTES
    get "/workingtimes/", WorkingTimeController, :index
    get "/workingtimes/:userID", WorkingTimeController, :show
    # get "/workingtimes/:userID/id", WorkingTimeController, :index
    post "/workingtimes/:userID", WorkingTimeController, :create
    put "/workingtimes/:id", WorkingTimeController, :update
    delete "/workingtimes/:id", WorkingTimeController, :delete
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
      live_dashboard "/dashboard", metrics: TimeManagerWeb.Telemetry
    end
  end
end
