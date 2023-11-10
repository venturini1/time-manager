defmodule TimeManagerWeb.ClockController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManager.Admin
  alias TimeManager.Admin.Clock
  alias TimeManager.Repo

  action_fallback TimeManagerWeb.FallbackController

  def create(conn, %{"userID" => userID} = clock_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        existing_clock = Admin.get_existing_clock(userID)

        case existing_clock do
          nil ->
            case Admin.create_clock(Map.put(clock_params, "user_id", userID)) do
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

          existing_clock ->
            case Admin.update_clock(existing_clock, clock_params) do
              {:ok, updated_clock} ->
                conn
                |> put_status(:ok)
                |> render("show.json", clock: updated_clock)

              {:error, changeset} ->
                conn
                |> put_status(:unprocessable_entity)
                |> render("error.json", %{error: "Failed to update clock", changeset: changeset})
            end
        end
      end
  end

  def show(conn, %{"userID" => userID}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        clock = Repo.get_by(Clock, user_id: userID)
        render(conn, "show.json", clock: clock)
      end
  end
end
