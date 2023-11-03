defmodule TimeManagerWeb.ClockController do
  use TimeManagerWeb, :controller

  alias TimeManager.Admin
  alias TimeManager.Admin.Clock
  alias TimeManager.Repo

  action_fallback TimeManagerWeb.FallbackController

  # def index(conn, _params) do
  #   clocks = Admin.list_clocks()
  #   render(conn, "index.json", clocks: clocks)
  # end

  # def create(conn, clock_params) do
  #   with {:ok, %Clock{} = clock} <- Admin.create_clock(clock_params) do
  #     conn
  #     |> put_status(:created)
  #     |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
  #     |> render("show.json", clock: clock)
  #   end
  # end

  def create(conn, %{"userID" => userID} = clock_params) do
    user = Admin.get_user!(userID)
    # userIDint = String.to_integer(userID)
    IO.puts(userID)
    case Admin.create_clock(Map.put(clock_params , "user_id", userID)) do
      {:ok, %Clock{} = clock} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
        |> render("show.json", clock: clock)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json", %{error: "Failed to create clock", changeset: changeset})
    end
  end

  # def show(conn, %{"id" => id}) do
  #   clock = Admin.get_clock!(id)
  #   render(conn, "show.json", clock: clock)
  # end

  def show(conn, %{"userID" => userID}) do
    user = Admin.get_user!(userID)
    # clock = Admin.get_clock!(userID)
    clock = Repo.get_by(Clock, user_id: userID)
    render(conn, "show.json", clock: clock)

    # Recherche de l'horloge associée à l'utilisateur

    # if clock do
    #   conn
    #   |> put_status(:ok)
    #   |> render("show.json", clock: clock)
    # else
    #   conn
    #   |> put_status(:not_found)
    #   |> render("error.json", %{error: "Clock not found for the specified user"})
    # end
  end
end
