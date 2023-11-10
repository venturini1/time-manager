defmodule TimeManager.Admin.User do
  use Ecto.Schema
  import Ecto.Changeset
  # import Bcrypt

  schema "users" do
    field :username, :string
    field :email, :string
    field :role, :string, default: "user"
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :role, :password])
    |> validate_required([:username, :email, :role, :password])
    |> unique_constraint(:email)
    |> validate_inclusion(:role, ["user", "manager", "admin"])
    |> hash_password()
  end

  defp hash_password(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      password ->
        put_change(changeset, :password, Bcrypt.hash_pwd_salt(password))
    end
  end
end
