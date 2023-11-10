defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManager.Admin
  alias TimeManager.Admin.User

  action_fallback TimeManagerWeb.FallbackController

  def index(conn, %{"email" => email, "username" => username}) do
    case Guardian.Plug.current_resource(conn) do
      nil ->
        conn |> put_status(401) |> json(%{error: "Please connect first"})

      _ ->
        users = Admin.get_user_filters(username, email)
        render(conn, "index.json", users: users)
    end
  end

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: "Please connect first"})
      _ ->
        users = Admin.list_users()
        render(conn, "index.json", users: users)
    end
    # case user do
    #   nil ->
    #     conn |> put_status(401) |> json(%{error: "Invalid credentials"})

    #   _ ->
    #     conn
    #     |> put_status(200)
    #     |> json(%{id: user.id, username: user.username, email: user.email, role: user.role})
    # end
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Admin.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Admin.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id} = user_params) do
    user = Admin.get_user!(id)

    with {:ok, %User{} = user} <- Admin.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Admin.get_user!(id)

    with {:ok, %User{}} <- Admin.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
