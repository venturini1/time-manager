defmodule TimeManagerWeb.AuthController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManagerWeb.Guardian
  alias TimeManager.Admin

  def get_token(conn, %{"email" => email, "password" => password}) do
    case Admin.get_user_by_email(email) do
      nil ->
        conn |> put_status(401) |> json(%{error: "Unknown user"})

      user ->
        case Bcrypt.verify_pass(password, user.password) do
          true ->
            {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
            conn |> put_status(200) |> json(%{token: jwt})

          false ->
            conn |> put_status(401) |> json(%{error: "Invalid credentials"})
        end
    end
  end

  def me(conn, _params) do
    user = Guardian.Plug.current_resource(conn)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: "Invalid credentials"})

      _ ->
        conn
        |> put_status(200)
        |> json(%{id: user.id, username: user.username, email: user.email, role: user.role})
    end
  end

  # def get_answer(user) do
  #   if Admin.user_is_admin(user) do
  #     "admin"
  #   else
  #     "not admin"
  #   end
  # end
end
