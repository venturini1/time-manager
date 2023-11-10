defmodule TimeManagerWeb.WorkingTimeView do
  use TimeManagerWeb, :view
  alias TimeManagerWeb.WorkingTimeView

  defp meta(len) do
    %{
      status: "success",
      record_count: len,
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end

  def render("index.json", %{workingtimes: workingtimes}) do
    %{data: render_many(workingtimes, WorkingTimeView, "working_time.json"), meta: meta(length(workingtimes))}
  end

  def render("show_all.json", %{working_times: working_times}) do
    %{data: render_many(working_times, WorkingTimeView, "working_time.json"), meta: meta(length(working_times))}
  end

  def render("show_one.json", %{working_time: working_time}) do
    len = case working_time do
      nil -> 0
      _ -> 1
    end
    %{data: render_one(working_time, WorkingTimeView, "working_time.json"), meta: meta(len)}
  end

  def render("working_time.json", %{working_time: working_time}) do
    %{id: working_time.id, start: working_time.start, end: working_time.end, user_id: working_time.user_id}
  end
end
