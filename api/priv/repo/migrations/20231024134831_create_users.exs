defmodule TimeManager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :role, :string, default: "user"
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
