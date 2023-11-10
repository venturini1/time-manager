defmodule TimeManagerWeb.AuthController do
  use TimeManagerWeb, :controller
  plug(Guardian.Plug.Pipeline, module: TimeManagerWeb.Guardian)
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
  alias TimeManagerWeb.Guardian
  alias TimeManager.Admin

  def get_token(conn, %{"email" => email, "password" => password}) do
    user = Admin.get_user_by_email_and_password(email, password)

    case user do
      nil ->
        conn |> put_status(401) |> json(%{error: "Invalid credentials"})

      _ ->
        {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user)
        conn |> put_status(200) |> json(%{token: jwt})
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
        |> json(%{email: user.email, id: user.id, the_answer: get_answer(user)})
    end
  end

  def get_answer(user) do
    if Admin.user_is_admin(user) do
      "he is admin"
    else
      "he is not..."
    end
  end
end
