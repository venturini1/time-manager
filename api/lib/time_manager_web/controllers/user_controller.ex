defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManager.Admin
  alias TimeManager.Admin.User

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, %{"email" => email, "username" => username}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case user.role do
          "user" ->
            conn |> put_status(403) |> json(%{error: %{code: "403", message: "Permission denied"}})

          _ ->
            users = Admin.get_user_filters(username, email)
            render(conn, "index.json", users: users)
        end
    end
  end

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case user.role do
          "user" ->
            conn |> put_status(403) |> json(%{error: %{code: "403", message: "Permission denied"}})

          _ ->
            users = Admin.list_users()
            render(conn, "index.json", users: users)
        end
    end
  end

  def create(conn, user_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case user.role do
          "admin" ->
            with {:ok, %User{} = created_user} <- Admin.create_user(user_params) do
              conn
              |> put_status(:created)
              |> put_resp_header("location", Routes.user_path(conn, :show, created_user))
              |> render("show.json", user: created_user)
            end
          _ ->
            conn |> put_status(403) |> json(%{error: %{code: "403", message: "Permission denied"}})

        end
    end
  end

  def show(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        user = Admin.get_user!(id)
        render(conn, "show.json", user: user)
      end
  end

  def update(conn, %{"id" => id} = user_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        user = Admin.get_user!(id)

        with {:ok, %User{} = user} <- Admin.update_user(user, user_params) do
          render(conn, "show.json", user: user)
        end
      end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        user = Admin.get_user!(id)

        with {:ok, %User{}} <- Admin.delete_user(user) do
          send_resp(conn, :no_content, "")
        end
      end
  end
end
