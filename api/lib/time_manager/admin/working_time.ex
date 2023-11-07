defmodule TimeManager.Admin.WorkingTime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do

    timestamps()
  end

  @doc false
  def changeset(working_time, attrs) do
    working_time
    |> cast(attrs, [])
    |> validate_required([])
  end
end
