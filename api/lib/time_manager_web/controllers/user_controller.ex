defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManager.Admin
  alias TimeManager.Admin.User

  action_fallback TimeManagerWeb.FallbackController

  # GET /api/users (with filters) - permissions ok
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

  # GET /api/users - permissions ok
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

  # GET /api/users/:id - permissions ok

  def show(conn, %{"id" => id}) do
    searching_id = String.to_integer(id)
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn
        |> put_status(401)
        |> json(%{error: %{code: "401", message: "Please connect first"}})

      %{"id" => ^searching_id} ->
        user = Admin.get_user!(id)
        render(conn, "show.json", user: user)

      _ ->
        case {user.id, user.role} do
          {^searching_id, "user"} ->
            # L'utilisateur peut accéder à ses propres informations même s'il a le rôle "user"
            user = Admin.get_user!(id)
            render(conn, "show.json", user: user)

          _ ->
            case user.role do
              "user" ->
                conn
                |> put_status(403)
                |> json(%{error: %{code: "403", message: "Permission denied"}})

              _ ->
                user = Admin.get_user!(id)
                render(conn, "show.json", user: user)
            end
        end
    end
  end

  # POST /api/users  - permissions ok
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

  # PUT /api/users/:id  - permissions ok
  def update(conn, %{"id" => id} = user_params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case user.role do
          "admin" ->
            update_user = Admin.get_user!(id)

            with {:ok, %User{} = update_user} <- Admin.update_user(update_user, user_params) do
              render(conn, "show.json", user: update_user)
            end
          _ ->
            conn |> put_status(403) |> json(%{error: %{code: "403", message: "Permission denied"}})
        end
      end
  end

  # DELETE /api/users/:id - permissions ok
  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: %{code: "401", message: "Please connect first"}})

      _ ->
        case user.role do
          "admin" ->
            delete_user = Admin.get_user!(id)

            with {:ok, %User{}} <- Admin.delete_user(delete_user) do
              send_resp(conn, :no_content, "")
            end
          _ ->
            conn |> put_status(403) |> json(%{error: %{code: "403", message: "Permission denied"}})
        end
      end
  end
end
