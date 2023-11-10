defmodule TimeManagerWeb.WorkingTimeController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManager.Admin
  alias TimeManager.Admin.WorkingTime

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        workingtimes = Admin.list_workingtimes()
        render(conn, "index.json", workingtimes: workingtimes)
      end
  end

  def create(conn, %{"userID" => userID} = working_time_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case Admin.create_working_time(Map.put(working_time_params , "user_id", userID)) do
          {:ok, %WorkingTime{} = working_time} ->
            conn
            |> put_status(:created)
            |> put_resp_header("location", Routes.clock_path(conn, :show, working_time))
            |> render("show_one.json", working_time: working_time)

          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> render("error.json", %{error: "Failed to create working_time", changeset: changeset})
        end
      end
  end

  def show_by_id(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        working_time = Admin.get_working_time!(id)
        render(conn, "show_one.json", working_time: working_time)
      end
  end

  def show(conn, %{"userID" => userID, "start" => date_start, "end" => date_end}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        working_times = Admin.get_working_time_by_user_id_with_filters(userID, date_start, date_end)
        render(conn, "show_all.json", working_times: working_times)
      end
  end

  def show(conn, %{"userID" => userID}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        working_times = Admin.get_working_time_by_user_id(userID)
        render(conn, "show_all.json", working_times: working_times)
      end
  end

  def update(conn, %{"id" => id} = working_time_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        working_time = Admin.get_working_time!(id)

        with {:ok, %WorkingTime{} = working_time} <- Admin.update_working_time(working_time, working_time_params) do
          render(conn, "show_one.json", working_time: working_time)
        end
      end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        working_time = Admin.get_working_time!(id)

        with {:ok, %WorkingTime{}} <- Admin.delete_working_time(working_time) do
          send_resp(conn, :no_content, "")
        end
      end
  end
end
