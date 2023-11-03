defmodule TimeManagerWeb.UserController do
  use TimeManagerWeb, :controller

  alias TimeManager.Admin
  alias TimeManager.Admin.User

  action_fallback TimeManagerWeb.FallbackController



#   def get_users_by(keyword) do
#     query =
#           from c in Users,
#             where: keyword,
#             select: c

#     Repo.all(query)
# end

  def index(conn, _params) do
    users = Admin.list_users()
    # users = get_users_by(username: username)
    render(conn, "index.json", users: users)
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
