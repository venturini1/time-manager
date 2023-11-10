defmodule TimeManagerWeb.UserView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.UserView

  defp meta(len) do
    %{
      status: "success",
      record_count: len,
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json"), meta: meta(length(users))}
  end

  def render("show.json", %{user: user}) do
    len = case user do
      nil -> 0
      _ -> 1
    end
    %{data: render_one(user, UserView, "user.json"), meta: meta(len)}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id, username: user.username, email: user.email, role: user.role, password: user.password, created_at: user.inserted_at, updated_at: user.updated_at}
  end
end
