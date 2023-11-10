defmodule TimeManagerWeb.ClockView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.ClockView

  defp meta(len) do
    %{
      status: "success",
      record_count: len,
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end

  # def render("index.json", %{clocks: clocks}) do
  #   %{data: render_many(clocks, ClockView, "clock.json")}
  # end

  def render("show.json", %{clock: clock}) do
    len = case clock do
      nil -> 0
      _ -> 1
    end
    %{data: render_one(clock, ClockView, "clock.json"), meta: meta(len)}
  end

  def render("clock.json", %{clock: clock}) do
    %{id: clock.id, time: clock.time, status: clock.status, user_id: clock.user_id}
  end
end
